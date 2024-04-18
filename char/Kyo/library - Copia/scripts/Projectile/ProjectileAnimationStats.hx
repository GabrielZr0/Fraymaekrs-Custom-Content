// Animation stats for Character Template Projectile
{
	projectileSpawn: { endType:AnimationEndType.NONE,slideOff: true},
	projectileIdle: { endType:AnimationEndType.LOOP,slideOff: true},
	// IMPORTANT: when an animation changes, the "id" of the hitboxes are refreshed
	// This projectile changes animations when it detects a hit, which could cause the projectile to hit the same character again
	// To avoid this, we set "resetId" to false
	projectileDestroy: {xSpeedConservation:0, ySpeedConservation:0, gravity:0,gravityMultiplier:0,resetId:false,slideOff: true}
}
