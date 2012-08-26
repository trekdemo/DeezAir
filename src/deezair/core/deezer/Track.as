package deezair.core.deezer {

  import deezair.core.Deezer;
  import deezair.core.deezer.BaseEntity;
  
  import flash.events.Event;
  import flash.net.URLLoader;
  import flash.net.URLRequest;
  
  import mx.collections.ArrayList;

  public class Track extends BaseEntity {

    public static const ENDPOINT : String = Deezer.API_BASE + 'track/';
    public static const SEARCH_ENDPOINT:String = Deezer.API_BASE + 'search/track/?q=';

    private   var _artistObject   : Artist;  // Object reference for the Artist of the track
    private   var _albumObject    : Album;   // Object reference for the Album of the track

    public function Track( attributes:Object = null ) { super( attributes ); }

    // = API == http://developers.deezer.com/api/track =========================
    // = PROPERTIES ============================================================
    public function get readable()      : Boolean { return attributes['readable']; }
    public function get title()         : String  { return attributes['title']; }
    public function get link()          : String  { return attributes['link']; }
    public function get duration()      : int     { return attributes['duration']; }
    public function get trackPosition() : int     { return attributes['track_position']; }
    public function get diskNumber()    : int     { return attributes['disk_number']; }
    public function get rank()          : int     { return attributes['rank']; }
    public function get releasjDate()   : Date    { return attributes['release_date']; }
    public function get preview()       : String  { return attributes['preview']; }

    public override function get entityURL():String  {
      return ENDPOINT + id.toString();
    }

    public function get artistName():String  {
      return !!artist ? artist.name : '';
    }

    public function get album() : Album {
      if ( isLoaded && !_albumObject ) {
        _albumObject = new Album( attributes['album'] );
      }
      return _albumObject;
    }

    public function get artist() : Artist {
      if ( isLoaded && !_artistObject ) {
        _artistObject = new Artist( attributes['artist'] );
      }
      return _artistObject;
    }


    // = STATICTIC FUNCTIONS ===================================================
    public static function fromJSON( json:String ):Track {
      return (new Track()).fromJSON( json ) as Track;
    }

    public static function find( id : int ): Track {
      var track : Track = new Track( {id: id} );
      track.load();
      return track;
    }

    public static function searchPath( query:String ):String {
      return SEARCH_ENDPOINT + query;
    }
    public static function search( query:String ):void {
      var loader:URLLoader = new URLLoader();
      var req:URLRequest = new URLRequest( searchPath( query ) );
      loader.addEventListener( flash.events.Event.COMPLETE, function(e:Event):void {
        var json:Object = JSON.parse( e.target.data );
        var tracks:ArrayList = DeezAirBase.instance.tracks;
        tracks.removeAll();
        for each( var t:Object in json['data'] ) {
          tracks.addItem( new Track( t ) );
        }
      });
      loader.load(req);
    }

    // = INSTANCE FUNCTIONS ====================================================
    public override function toString():String {
      return "[Class Track] " + artistName + " - " + title;
    }

  }
}

