package {
  import flash.display.Sprite;
  import flash.events.Event;
  import deezair.core.Deezer;
  import deezair.core.deezer.*;

  public class DeezAir extends Sprite {

    public function DeezAir() {
      trace(">> DeezAir Instantiated!");

      addEventListener( Event.ADDED_TO_STAGE, addedToStage );
    }

    protected function addedToStage( event:Event ):void {
      removeEventListener( Event.ADDED_TO_STAGE, addedToStage );
      trace( ">> Added to stage" );

      var track:Track = Track.find( 3135556 );
      trace( track );
    }

  }
}

