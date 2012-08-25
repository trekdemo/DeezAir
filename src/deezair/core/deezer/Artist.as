package deezair.core.deezer {

  import deezair.core.deezer.BaseEntity;

  public class Artist extends BaseEntity {

    protected var _id       : int     // The artist's Deezer id
    protected var _name     : String  // The artist's name
    protected var _link     : String  // The url of the artist on Deezer
    protected var _picture  : String  // The url of the artist picture. Add 'size' parameter to the url to change size. Can be 'small', 'medium', 'big'
    protected var _nb_album : int     // The number of artist's albums
    protected var _nb_fan   : int     // The number of artist's fans
    protected var _radio    : Boolean // true if the artist has a smartradio

    public function Artist() {
    }

    public static function fromJSON( json:Object ):Artist {
      return new Artist();
    }

  }
}

