// Assist stats for Template Assist

// Define some states for our state machine
STATE_IDLE = 0;
STATE_STARTUP = 1;
STATE_CHARGE = 2;
STATE_DASH = 3;
STATE_OUTRO = 4;
STATE_JSLASH = 5;

{
	spriteContent: self.getResource().getContent("assistjiro"),
	initialState: STATE_IDLE,
	stateTransitionMapOverrides: [
		STATE_IDLE => {
			animation: "idle"
		},
		STATE_STARTUP => {
			animation: "spindashstart"
		},
		STATE_CHARGE => {
			animation: "spindashcharge"
		},
		STATE_DASH => {
			animation: "spindash"
		},
		STATE_OUTRO => {
			animation: "outro"
		},
		STATE_JSLASH => {
			animation: "jumpslash"
		}
	],
	gravity: 0.8,
	baseScaleX: 1.0,
	baseScaleY: 1.0,
	terminalVelocity: 30,
	aerialSpeedAcceleration: 0.45,
	aerialSpeedCap: 30.5,
	aerialFriction: 1.22,
	assistChargeValue:50
}
