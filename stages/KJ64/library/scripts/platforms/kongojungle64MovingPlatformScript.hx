// Script for Stage Template moving platform beneath the stage

var startX = 0;
var startY = 0;
var movingRight = self.makeBool(true);
var MOVE_DISTANCE = 135 * 2 - 165;
var movingDown = self.makeBool(true);
var MOVE_DISTANCE2 = 156 * 2 - 165;

function initialize(){
	startX = self.getX();
	startY = self.getY();
}

function onTeardown(){
	sprite.get().dispose();
	sprite.set(null);
}

function update(){
	if (movingRight.get()){
		self.setX(self.getX() + 1);
		if (self.getX() >= startX + MOVE_DISTANCE){
			movingRight.set(false);
		}
	}else{
		self.setY(self.getY() + 1);
		if (self.getY() <= startY){
			movingRight.set(true);
		}
	}else{
		self.setX(self.getX() - 1);
		if (self.getX() <= startX){
			movingRight.set(true);
		}
	}
}
