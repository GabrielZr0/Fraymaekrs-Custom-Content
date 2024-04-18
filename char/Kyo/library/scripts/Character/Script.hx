// API Script


var neutralSpecialProjectile = self.makeObject(null); // Tracks active Neutral Special projectile (in case we need to handle any special cases)

var lastDisabledNSpecStatusEffect = self.makeObject(null);

var downSpecialLoopCheckTimer = self.makeInt(-1);

//offset projectile start position
var NSPEC_PROJ_X_OFFSET = 40;
var NSPEC_PROJ_Y_OFFSET = 0;

var NEUTRAL_SPECIAL_COOLDOWN = 60;

// start general functions --- 

//Runs on object init
function initialize() {
    self.addEventListener(GameObjectEvent.LINK_FRAMES, handleLinkFrames, { persistent: true });
}

function update() {

}

// CState-based handling for LINK_FRAMES
// needed to ensure important code that would be skipped during the transition is still executed
function handleLinkFrames(e) {
    if (self.inState(CState.SPECIAL_SIDE)) {
        if (self.getCurrentFrame() >= 14) {
            self.updateAnimationStats({ bodyStatus: BodyStatus.NONE });
        }
    } else if (self.inState(CState.SPECIAL_DOWN)) {
        specialDown_resetTimer();
        downSpecialLoopCheckTimer.set(self.addTimer(1, -1, specialDown_checkLoop));
    }
}

function onTeardown() {

}

// --- end general functions


//Rapid Jab logic
function jab3Loop() {
    if (self.getHeldControls().ATTACK) {
        self.playFrame(2);
    }
}

//-----------DASH ATTACK EX-----------
//jump cancel hit confirm
function dashAttackHit() {
    self.updateAnimationStats({ allowJump: true });
}

function dashAttack_gotoAlternate() {
    Common.onButtonsPressed(Buttons.SPECIAL, function () {
        if (self.getPressedControls().SPECIAL) {
            self.playAnimation("dash_attack_EX");
        }
    });
}
//-----------Strong Up EX-----------
function strong_up_gotoAlternate() {
    Common.onButtonsPressed(Buttons.ATTACK, function () {
        if (self.getPressedControls().ATTACK) {
            self.playAnimation("strong_up_EX");
        }
    });
}

//-----------NEUTRAL SPECIAL-----------

//projectile
function fireNSpecialProjectile() {
    neutralSpecialProjectile.set(match.createProjectile(self.getResource().getContent("kusanagikyoNspecProjectile"), self));
    neutralSpecialProjectile.get().setX(self.getX() + self.flipX(NSPEC_PROJ_X_OFFSET));
    neutralSpecialProjectile.get().setY(self.getY() + NSPEC_PROJ_Y_OFFSET);
}

//cooldown timer
function startNeutralSpecialCooldown() {
    disableNeutralSpecial();
    self.addTimer(NEUTRAL_SPECIAL_COOLDOWN, 1, enableNeutralSpecial, { persistent: true });
}

function disableNeutralSpecial() {
    if (lastDisabledNSpecStatusEffect.get() != null) {
        self.removeStatusEffect(StatusEffectType.DISABLE_ACTION, lastDisabledNSpecStatusEffect.get().id);
    }
    lastDisabledNSpecStatusEffect.set(self.addStatusEffect(StatusEffectType.DISABLE_ACTION, CharacterActions.SPECIAL_NEUTRAL));
}

function enableNeutralSpecial() {
    if (lastDisabledNSpecStatusEffect.get() != null) {
        self.removeStatusEffect(StatusEffectType.DISABLE_ACTION, lastDisabledNSpecStatusEffect.get().id);
        lastDisabledNSpecStatusEffect.set(null);
    }
}

//-----------SIDE SPECIAL-----------
function dacingBladeCombo() {
    if (self.getPressedControls().ATTACK) {
        self.playFrame(37);
    } else if (self.getPressedControls().ATTACK) {
        self.playFrame(64);
    }
}

function dacingBladeCombo2() {
    if (self.getPressedControls().ATTACK) {
        self.playFrame(94);
    } else if (self.getPressedControls().ATTACK) {
        self.playFrame(127);
    }
}

//-----------DOWN SPECIAL-----------

function specialDown_gotoEndlag() {
    if (self.isOnFloor()) {
        self.playAnimation("special_down_endlag");
    } else {
        self.playAnimation("special_down_air_endlag");
    }
}
function specialDown_resetTimer() {
    self.removeTimer(downSpecialLoopCheckTimer.get());
    downSpecialLoopCheckTimer.set(-1);
}

function specialDown_checkLoop() {
    var heldControls: ControlsObject = self.getHeldControls();

    if (!heldControls.SPECIAL) {
        specialDown_resetTimer();
        specialDown_gotoEndlag();
    }
}

function specialDown_gotoLoop() {
    if (self.isOnFloor()) {
        self.playAnimation("special_down_loop");
    } else {
        self.playAnimation("special_down_air_loop");
    }

    //failsafe
    specialDown_resetTimer();

    // start checking inputs
    downSpecialLoopCheckTimer.set(self.addTimer(1, -1, specialDown_checkLoop));
}