package deezair.core.deezer {

  import deezair.core.Deezer;
  import deezair.core.deezer.BaseEntity;

  public class Album extends BaseEntity {

    public static const END_POINT : String = Deezer.API_BASE + 'album/';

    public function get title()       : String { return attributes['title']; }        // The album's title
    public function get link()        : String { return attributes['link']; }         // The url of the album on Deezer
    public function get cover()       : String { return attributes['cover']; }        // The url of the album's cover. Add 'size' parameter to the url to change size. Can be 'small', 'medium', 'big'
    public function get label()       : String { return attributes['label']; }        // The album's label name
    public function get duration()    : int    { return attributes['duration']; }     // The album's duration (seconds)
    public function get fans()        : int    { return attributes['fans']; }         // The number of album's Fans
    public function get rating()      : int    { return attributes['rating']; }       // The playlist's rate
    public function get releaseDate() : Date   { return attributes['release_date']; } // The album's release date
    public function get artist()      : Object { return attributes['artist']; }       // artist object containing : id, name
    public function get tracks()      : Array  { return attributes['tracks']; }       // list of track

    public override function get entityURL():String  {
      return END_POINT + id.toString();
    }

    public function Album( attributes:Object = null ) { super( attributes ); }

    public static function fromJSON( json:String ):Album {
      return ( new Album() ).fromJSON( json ) as Album;
    }

    public static function find( id : int ):Album {
      var album : Album = new Album( id );
      album.load();
      return album;
    }

  }
}

