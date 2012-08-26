package {

  import deezair.core.Deezer;
  import deezair.core.deezer.*;
  import deezair.core.events.EntityEvent;
  
  import flash.display.Sprite;
  import flash.events.Event;
  
  import mx.collections.ArrayList;
  import mx.core.WindowedApplication;

  public class DeezAirBase {

    private static var _instance:DeezAirBase;
    private var app:DeezAir;
    
    [Bindable]
    public var tracks:ArrayList;
    
    public static function get instance():DeezAirBase { return _instance; }
    
    public static function init( app:DeezAir ):void {
      _instance = new DeezAirBase( app );
    }
    
    public function DeezAirBase( app:DeezAir ) {
      trace(">> DeezAir Instantiated!");
      this.app = app;
      this.tracks = new ArrayList();

      var track:Track = Track.find( 3135556 );
      track.addEventListener( EntityEvent.LOADED, onTrackLoaded );
    }
    
    public function search( q:String ):void {
      Track.search( q );
    }

    protected function onTrackLoaded( event:EntityEvent ):void {
      tracks.removeAll();
      tracks.addItem( event.entity );
      app.trackList.dataProvider = tracks;
    }
  }
}

