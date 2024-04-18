// Stats for Template Stage

{
	spriteContent: self.getResource().getContent("towerofheaven"),
	animationId: "stage",
	ambientColor: 0x730c2833,
	shadowLayers: [
		{
			id: "0",
			maskSpriteContent: self.getResource().getContent("towerofheaven"),
			maskAnimationId: "shadowMaskFront",
			color:0xCC080514,
			foreground: true
		},
		{
			id: "1",
			maskSpriteContent: self.getResource().getContent("towerofheaven"),
			maskAnimationId: "shadowMask",
			color:0xCC080514,
			foreground: false
		}
	],
	camera: {
		startX : 0,
		startY : 43,
		zoomX : 0,
		zoomY : 0,
		camEaseRate : 1 / 11,
		camZoomRate : 1 / 15,
		minZoomHeight : 360,
		initialHeight: 360,
		initialWidth: 640,
		backgrounds: [
			// Sky
			{
				spriteContent: self.getResource().getContent("towerofheaven"),
				animationId: "parallax0",
				mode: ParallaxMode.BOUNDS,
				originalBGWidth: 768,
				originalBGHeight: 432,
				horizontalScroll: false,
				verticalScroll: false,
				loopWidth: 0,
				loopHeight: 0,
				xPanMultiplier: 0.06,
				yPanMultiplier: 0.06,
				scaleMultiplier: 1,
				foreground: false,
				depth: 2001
			},
			// Moon
			{
				spriteContent: self.getResource().getContent("towerofheaven"),
				animationId: "moon",
				mode: ParallaxMode.DEPTH,
				originalBGWidth: 298,
				originalBGHeight: 298,
				horizontalScroll: false,
				verticalScroll: false,
				loopWidth: 0,
				loopHeight: 0,
				xPanMultiplier: 0.235,
				yPanMultiplier: 0.235,
				scaleMultiplier: 1,
				foreground: false,
				depth: 2500
			},
			// Clouds
			{
				spriteContent: self.getResource().getContent("towerofheaven"),
				animationId: "cloud_back",
				mode: ParallaxMode.DEPTH,
				originalBGWidth: -1200,
				originalBGHeight: 250,
				horizontalScroll: true,
				verticalScroll: false,
				loopWidth: 0,
				loopHeight: 0,
				xPanMultiplier: 0.435,
				yPanMultiplier: 0.435,
				scaleMultiplier: 1,
				foreground: false,
				depth: 1750
			},			
			// Fog
			{
				spriteContent: self.getResource().getContent("towerofheaven"),
				animationId: "fog",
				mode: ParallaxMode.DEPTH,
				originalBGWidth: 1542,
				originalBGHeight: 93,
				horizontalScroll: true,
				verticalScroll: false,
				loopWidth: 0,
				loopHeight: 0,
				xPanMultiplier: 0.335,
				yPanMultiplier: 0.335,
				scaleMultiplier: 1,
				foreground: false,
				depth: 1750
			}
		]
	}
}
