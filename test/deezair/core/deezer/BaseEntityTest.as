package deezair.core.deezer  {
    
    import asunit.asserts.*;
    import asunit.framework.IAsync;
    import flash.display.Sprite;

    public class BaseEntityTest {

        [Inject]
        public var async:IAsync;

        [Inject]
        public var context:Sprite;

        private var instance:BaseEntity;

        [Before]
        public function setUp():void {
            instance = new BaseEntity();
        }

        [After]
        public function tearDown():void {
            instance = null;
        }

        [Test]
        public function shouldBeInstantiated():void {
            assertTrue("instance is BaseEntity", instance is BaseEntity);
        }
    }
}

