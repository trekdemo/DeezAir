package deezair.core.events {
	
  import deezair.core.deezer.BaseEntity;
  import flash.events.Event;

  public class EntityEvent extends Event {
    public static const LOADED : String = 'entityLoaded';

    private var _entity:BaseEntity;
    public function get entity():BaseEntity { return _entity; }

    public function EntityEvent( type:String, entity:BaseEntity, bubbles:Boolean = false, cancelable:Boolean = false ) {
      _entity = entity;
      super( type, bubbles, cancelable );
    }
  }
}
