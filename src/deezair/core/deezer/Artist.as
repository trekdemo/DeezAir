package deezair.core.deezer {

  import deezair.core.Deezer;
  import deezair.core.deezer.BaseEntity;

  public class Artist extends BaseEntity {

    public static const END_POINT : String = Deezer.API_BASE + 'artist/';

    public function get name()    : String  { return attributes['name']; }     // The artist's name
    public function get link()    : String  { return attributes['link']; }     // The url of the artist on Deezer
    public function get picture() : String  { return attributes['picture']; }  // The url of the artist picture. Add 'size' parameter to the url to change size. Can be 'small', 'medium', 'big'
    public function get nbAlbum() : int     { return attributes['nb_album']; } // The number of artist's albums
    public function get nbFan()   : int     { return attributes['nb_fan']; }   // The number of artist's fans
    public function get radio()   : Boolean { return attributes['radio']; }    // true if the artist has a smartradio

    public override function get entityURL():String  {
      return END_POINT + id.toString();
    }

    public function Artist( attributes:Object = null ) { super( attributes ); }

    public static function fromJSON( json:String ):Artist {
      return ( new Artist() ).fromJSON( json ) as Artist;
    }

  }
}

