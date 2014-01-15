-- config.lua

application =
{
    content =
	{
		width = 720,
		height = 1280,
		--scale = "letterbox" 
        scale = "zoomStretch",
        fps = 30,
	},
}

storyboard = require("storyboard")
createMoleSprite = require("createMoleSprite")