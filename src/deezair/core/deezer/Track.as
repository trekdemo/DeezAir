package deezair.core.deezer {

  import deezair.core.deezer.BaseEntity;

  public class Track extends BaseEntity {

    // = API == http://developers.deezer.com/api/track =========================
    protected var _id             : int;     // The track's Deezer id
    protected var _readable       : Boolean; // true if the track is readable in the player for the current user
    protected var _title          : String;  // The track's title
    protected var _link           : String;  // The url of the track on Deezer
    protected var _duration       : int;     // The track's duration in seconds
    protected var _track_position : int;     // The position of the track in its album
    protected var _disk_number    : int;     // The track's album's disk number
    protected var _rank           : int;     // The track's Deezer rank
    protected var _release_date   : Date;    // The track's release date
    protected var _preview        : String;  // The url of track's preview file. This file contains the first 30 seconds of the track
    protected var _artist         : Object;  // artist object containing : id, name, link, picture, nb_album, nb_fan, radio
    protected var _album          : Object;  // album object containing : id, title, link, cover, genre_id, label, duration, fans, rating, release_date

    private   var _artistObject     : Artist;
    private   var _albumObject      : Album;

    public function Track() { }

    // = STATICTIC FUNCTIONS ===================================================
    public static function fromJSON( json:Object ):Track {
      return new Track();
    }

    // = PROPERTIES ============================================================
    public function get id()            : int     { return _id; }
    public function get readable()      : Boolean { return _readable; }
    public function get title()         : String  { return _title; }
    public function get link()          : String  { return _link; }
    public function get duration()      : int     { return _duration; }
    public function get trackPosition() : int     { return _track_position; }
    public function get diskNumber()    : int     { return _disk_number; }
    public function get rank()          : int     { return _rank; }
    public function get releasjDate()   : Date    { return _release_date; }
    public function get preview()       : String  { return _preview; }

    public function get album() : Album {
      if ( !_albumObject ) {
        _albumObject = Album.fromJSON( _album );
      }
      return _albumObject;
    }

    public function get artist() : Artist {
      if ( !_artistObject ) {
        _artistObject = Artist.fromJSON( _artist );
      }
      return _artistObject;
    }

  }
}

