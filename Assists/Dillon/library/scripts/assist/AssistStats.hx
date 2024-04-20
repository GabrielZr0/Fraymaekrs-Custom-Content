// Assist stats for Template Assist

// Define some states for our state machine
STATE_IDLE = 0;
STATE_STARTUP = 1;
STATE_CHARGE = 2;
STATE_DASH = 3;
STATE_OUTRO = 4;

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
		}
	],
	gravity: 0,
	terminalVelocity: 20,
	assistChargeValue:50
}
