package {
  import deezair.core.Deezer;
  import deezair.core.deezer.*;
  import deezair.core.events.EntityEvent;
  
  import flash.display.Sprite;
  import flash.events.Event;

  public class DeezAir extends Sprite {

    public function DeezAir() {
      trace(">> DeezAir Instantiated!");

      addEventListener( Event.ADDED_TO_STAGE, addedToStage );
    }

    protected function addedToStage( event:Event ):void {
      removeEventListener( Event.ADDED_TO_STAGE, addedToStage );
      trace( ">> Added to stage" );

      var track:Track = Track.find( 3135556 );
	  track.addEventListener( EntityEvent.LOADED, onTrackLoaded );
    }
	
	protected function onTrackLoaded( event:EntityEvent ):void {
		trace( event.target );
	}

  }
}

