package deezair.core.deezer {

  import flash.events.Event;
  import flash.events.EventDispatcher;
  import flash.events.IOErrorEvent;
  import flash.events.SecurityErrorEvent;
  import flash.net.URLLoader;
  import flash.net.URLRequest;

  public class BaseEntity extends EventDispatcher {

    protected var _id             : int;     // The object's Deezer id
    private   var _loaded         : Boolean = false;

    public function BaseEntity( id : int ) {
      _id = id;
    }


    // = PROPERTIES ============================================================
    public function get isLoaded()  : Boolean { return _loaded; }
    public function get entityURL() : String  { throw new Error( 'Not implemented' ); }


    // = STATICTIC FUNCTIONS ===================================================
    protected static function createRequest( delegate : BaseEntity ) : URLLoader {
      trace( 'Create request for: ' + delegate );
      var loader:URLLoader = new URLLoader();

      loader.addEventListener( Event.COMPLETE, delegate.requestComplete );
      loader.addEventListener( IOErrorEvent.IO_ERROR, delegate.requestError );
      loader.addEventListener( SecurityErrorEvent.SECURITY_ERROR, delegate.requestError );

	  return loader;
    }

    public static function fromJSON( json : Object ):Object {
      throw new Error( 'Not implemented' );
    }


    // = INSTANCE FUNCTIONS ====================================================
    protected function fromJSON( json:Object ):BaseEntity {
      throw new Error( 'Not implemented' );
    }

    public function load():void {
      if( !isLoaded ) reload();
    }

    public function reload():void {
      var loader : URLLoader = createRequest( this );
      loader.load( new URLRequest( entityURL ) );
    }


    // = EVENT HANDLERS ========================================================
    protected function requestComplete( event : Event ):* {
      trace( event );
      trace( event.target.data );
      _loaded = true;
      this.fromJSON( event.target.data );
    }

    protected function requestError( event : Event ):* {
      trace( event );
    }

  }
}

