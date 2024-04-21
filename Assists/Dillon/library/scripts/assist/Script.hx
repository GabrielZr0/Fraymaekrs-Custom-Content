// API Script for Template Assist

// Set up same states as AssistStats (by excluding "var", these variables will be accessible on timeline scripts!)
STATE_IDLE = 0;
STATE_STARTUP = 1;
STATE_CHARGE = 2;
STATE_DASH = 3;
STATE_OUTRO = 4;

var SPAWN_X_DISTANCE = 0; // How far in front of player to spawn
var SPAWN_HEIGHT = 0; // How high up from player to spawn

// Runs on object init
function initialize(){
	// Face the same direction as the user
	if (self.getOwner().isFacingLeft()) {
		self.faceLeft();
	}

	if (self.getOwner().isOnFloor()==false)
	{
		self.toState(STATE_DASH);
	}
	
	// Reposition relative to the user
	Common.repositionToEntityEcb(self.getOwner(), self.flipX(SPAWN_X_DISTANCE), -SPAWN_HEIGHT);

	// Add fade in effect
	Common.startFadeIn();
}


function update(){
	// Behavior for each state
	if (self.inState(STATE_IDLE)) {
		if (self.finalFramePlayed()) {
			// Bounce into air, activate gravity, and switch to jump state
			self.toState(STATE_STARTUP); 
		}
	} else if (self.inState(STATE_STARTUP)) {
		if (self.finalFramePlayed()) {
			self.toState(STATE_CHARGE); 
		}	
		
	} else if (self.inState(STATE_CHARGE)) {
		if (self.finalFramePlayed()) {
				self.toState(STATE_DASH); 
		}
	} else if (self.inState(STATE_DASH)) {
		if (self.finalFramePlayed()) {
			// Move to outro state and start fading away
			self.toState(STATE_OUTRO); 
			Common.startFadeOut();
		}
	} else if (self.inState(STATE_OUTRO)) {
		if (Common.fadeOutComplete() && self.finalFramePlayed()) {
			// Destroy
			self.destroy();
		}
	}
}
function onTeardown(){
}

function loopCharge(){
}

