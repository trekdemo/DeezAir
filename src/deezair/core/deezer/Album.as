package deezair.core.deezer {

  import deezair.core.deezer.BaseEntity;

  public class Album extends BaseEntity {

    protected var _title        : String  // The album's title
    protected var _link         : String  // The url of the album on Deezer
    protected var _cover        : String  // The url of the album's cover. Add 'size' parameter to the url to change size. Can be 'small', 'medium', 'big'
    protected var _label        : String  // The album's label name
    protected var _duration     : int     // The album's duration (seconds)
    protected var _fans         : int     // The number of album's Fans
    protected var _rating       : int     // The playlist's rate
    protected var _release_date : Date    // The album's release date
    protected var _artist       : Object  // artist object containing : id, name
    protected var _tracks       : Array   // list of track

    public function Album( id : int ) { super( id ); }

  }
}

