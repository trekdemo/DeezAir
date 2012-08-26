package deezair.core.deezer {

  import deezair.core.events.EntityEvent;
  
  import flash.events.Event;
  import flash.events.EventDispatcher;
  import flash.events.IOErrorEvent;
  import flash.events.SecurityErrorEvent;
  import flash.net.URLLoader;
  import flash.net.URLRequest;

  public class BaseEntity extends EventDispatcher {

    protected var _id             : int;     // The object's Deezer id
    protected var _attributes     : Object   // Object containing the fields of the object
    protected var _loaded         : Boolean = false;

    public function BaseEntity( attributes:Object = null ) {
	  if( attributes ) {
        _id         = attributes['id'];
	    _attributes = attributes;
	  } else {
		_id = NaN;
		_attributes = new Object();
	  }
    }


    // = PROPERTIES ============================================================
    public function get id()         : int     { return _id; }
    public function get isLoaded()   : Boolean { return _loaded; }
    public function get attributes() : Object  { return _attributes; }
    public function get entityURL()  : String  { throw new Error( 'Not implemented' ); }


    // = STATICTIC FUNCTIONS ===================================================
    protected static function createRequest( delegate : BaseEntity ) : URLLoader {
      trace( 'Create request for: ' + delegate );
      var loader:URLLoader = new URLLoader();

      loader.addEventListener( Event.COMPLETE, delegate.requestComplete );
      loader.addEventListener( IOErrorEvent.IO_ERROR, delegate.requestError );
      loader.addEventListener( SecurityErrorEvent.SECURITY_ERROR, delegate.requestError );

      return loader;
    }


    // = INSTANCE FUNCTIONS ====================================================
    protected function fromJSON( json:String ):BaseEntity {
      _attributes = JSON.parse( json );
      _id         = _attributes['id'];

      return this;
    }

    public function load():void {
      if( !isLoaded ) reload();
    }

    public function reload():void {
      _loaded = false;
	  _attributes ||= new Object();
      var loader : URLLoader = createRequest( this );
      loader.load( new URLRequest( entityURL ) );
    }


    // = EVENT HANDLERS ========================================================
    protected function requestComplete( event : Event ):void {
      _loaded = true;
      this.fromJSON( event.target.data );
      this.dispatchEvent( new EntityEvent( EntityEvent.LOADED, this ) );
    }

    protected function requestError( event : Event ):* {
      trace( event );
    }

  }
}

