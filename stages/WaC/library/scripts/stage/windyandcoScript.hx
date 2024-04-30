// API Script for Stage Template

var CLOUD_BACK_2_X_SPEED = 0.05; // Cloud back 2 scroll speed
var CLOUD_BACK_2_WIDTH = 1542; // Determines loop point, should match physical size based on stats scaling
var CLOUD_BACK_1_X_SPEED = 0.075; // Cloud back 1 scroll speed
var CLOUD_BACK_1_WIDTH = 1542; // Determines loop point, should match physical size based on stats scaling

// Vars
var cloudBack2XOffset = self.makeFloat(0);
var cloudBack1XOffset = self.makeFloat(0);

function initialize(){
	// Don't animate the stage itself (we'll pause on one version for hazards on, and another version for hazards off)
	self.playLabel("hazardsoff");
	match.createVfx(new VfxStats({spriteContent: self.getResource().getContent("windyandco"), animation: "windmill", x:0, y:0, scaleX:1, scaleY:1,layer:VfxLayer.CHARACTERS_BACK}));
	if (match.getMatchSettingsConfig().hazards) {
		// Hazards are on, enable the platform beneath the stage
		self.playLabel("hazardson");
		match.createVfx(new VfxStats({spriteContent: self.getResource().getContent("windyandco"), animation: "windyanimated", x:0, y:0, scaleX:1, scaleY:1,layer:VfxLayer.CHARACTERS_BACK, loop:true}));
	}

}

function update(){
		scrollBackgrounds();
}

function scrollBackgrounds() {
	cloudBack2XOffset.set((cloudBack2XOffset.get() + CLOUD_BACK_2_X_SPEED) % CLOUD_BACK_2_WIDTH);
	cloudBack1XOffset.set((cloudBack1XOffset.get() + CLOUD_BACK_1_X_SPEED) % CLOUD_BACK_1_WIDTH);
	camera.setBackgroundOffset(1, cloudBack2XOffset.get(), 0);
	camera.setBackgroundOffset(2, cloudBack1XOffset.get(), 0);
}

function onTeardown(){
}
function onKill(){
}
function onStale(){
}
function afterPushState(){
}
function afterPopState(){
}
function afterFlushStates(){
}

package
{
   public class YoshisIsland_RotatingPlatform extends SSF2Platform
   {
       
      
      protected var m_angle:Number;
      
      protected const CENTERX:Number = 237;
      
      protected const CENTERY:Number = 85;
      
      protected const DISTANCE:Number = 112;
      
      public function YoshisIsland_RotatingPlatform(param1:*)
      {
         super(param1);
      }
      
      override public function initialize() : void
      {
         this.m_angle = 0;
      }
      
      override public function update() : void
      {
         setXSpeed(this.CENTERX + this.DISTANCE * Math.cos(this.m_angle * Math.PI / 180) - getMC().width / 2 - getX());
         setYSpeed(this.CENTERY - this.DISTANCE * Math.sin(this.m_angle * Math.PI / 180) - getMC().height / 2 - getY());
         --this.m_angle;
      }
   }
}
