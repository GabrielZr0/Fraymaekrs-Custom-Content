// Stats for Template Stage

{
	spriteContent: self.getResource().getContent("goldentemple"),
	animationId: "stage",
	ambientColor: 0x40ffe0c9,
	shadowLayers: [
		{
			id: "0",
			maskSpriteContent: self.getResource().getContent("goldentemple"),
			maskAnimationId: "shadowMaskFront",
			color:0x994c2525,
			foreground: true
		},
		{
			id: "1",
			maskSpriteContent: self.getResource().getContent("goldentemple"),
			maskAnimationId: "shadowMask",
			color:0x994c2525,
			foreground: false
		},{
			id: "2",
			maskSpriteContent: self.getResource().getContent("goldentemple"),
			maskAnimationId: "shadowMaskFront1",
			color:0x992f3544,
			foreground: true
		},
		{
			id: "3",
			maskSpriteContent: self.getResource().getContent("goldentemple"),
			maskAnimationId: "shadowMask1",
			color:0x992f3544,
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
				spriteContent: self.getResource().getContent("goldentemple"),
				animationId: "parallax0",
				mode: ParallaxMode.BOUNDS,
				originalBGWidth: 640,
				originalBGHeight: 360,
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
			// Clouds
			{
				spriteContent: self.getResource().getContent("goldentemple"),
				animationId: "parallax1",
				mode: ParallaxMode.DEPTH,
				originalBGWidth: 640,
				originalBGHeight: 360,
				horizontalScroll: false,
				verticalScroll: false,
				xPanMultiplier: 1.0,
				yPanMultiplier: 1.0,
				scaleMultiplier: 1.3,
				foreground: false,
				depth: 2500
			},
			// Clouds 2
			{
				spriteContent: self.getResource().getContent("goldentemple"),
				animationId: "parallax2",
				mode: ParallaxMode.DEPTH,
				originalBGWidth: 640,
				originalBGHeight: 360,
				horizontalScroll: false,
				verticalScroll: false,
				xPanMultiplier: 1.0,
				yPanMultiplier: 1.0,
				scaleMultiplier: 1.3,
				foreground: false,
				depth: 1750
			}
		]
	}
}
