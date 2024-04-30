// Stats for Template Stage

{
	spriteContent: self.getResource().getContent("windyandco"),
	animationId: "stage",
	ambientColor: 0x40f0a672,
	shadowLayers: [
		{
			id: "0",
			maskSpriteContent: self.getResource().getContent("windyandco"),
			maskAnimationId: "shadowMaskFront",
			color:0x994c2525,
			foreground: true
		},
		{
			id: "1",
			maskSpriteContent: self.getResource().getContent("windyandco"),
			maskAnimationId: "shadowMask",
			color:0x994c2525,
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
				spriteContent: self.getResource().getContent("windyandco"),
				animationId: "parallax0",
				mode: ParallaxMode.BOUNDS,
				originalBGWidth: 300,
				originalBGHeight: 300,
				horizontalScroll: false,
				verticalScroll: false,
				loopWidth: 0,
				loopHeight: 0,
				xPanMultiplier: 0.06,
				yPanMultiplier: 0.06,
				scaleMultiplier: 1.1,
				foreground: false,
				depth: 2001
			},
			// Clouds
			{
				spriteContent: self.getResource().getContent("windyandco"),
				animationId: "cloud_back",
				mode: ParallaxMode.DEPTH,
				originalBGWidth: 1542,
				originalBGHeight: 93,
				horizontalScroll: true,
				verticalScroll: false,
				loopWidth: 0,
				loopHeight: 0,
				xPanMultiplier: 0.135,
				yPanMultiplier: 0.135,
				scaleMultiplier: 1,
				foreground: false,
				depth: 2500
			},
			// Clouds 2
			{
				spriteContent: self.getResource().getContent("windyandco"),
				animationId: "cloud_back_2",
				mode: ParallaxMode.DEPTH,
				originalBGWidth: 1542,
				originalBGHeight: 93,
				horizontalScroll: true,
				verticalScroll: false,
				loopWidth: 0,
				loopHeight: 0,
				xPanMultiplier: 0.135,
				yPanMultiplier: 0.135,
				scaleMultiplier: 1,
				foreground: false,
				depth: 1750
			}
		]
	}
}
