// Assist stats for Template Assist

// Define some states for our state machine
STATE_IDLE = 0;
STATE_JUMP = 1;
STATE_FALL = 2;
STATE_SLAM = 3;
STATE_OUTRO = 4;

{
	spriteContent: self.getResource().getContent("assistjiro"),
	initialState: STATE_IDLE,
	stateTransitionMapOverrides: [
		STATE_IDLE => {
			animation: "idle"
		},
		STATE_JUMP => {
			animation: "spindashstart"
		},
		STATE_FALL => {
			animation: "spindashcharge"
		},
		STATE_SLAM => {
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
