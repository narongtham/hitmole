
-- create center
centerX = display.contentCenterX
centerY = display.contentCenterY
contentWidth = display.viewableContentWidth
contentHeight = display.viewableContentHeight


local storyboard = require("storyboard")
storyboard.gotoScene("gameScene") --splashScene

display.setStatusBar(display.HiddenStatusBar) 
