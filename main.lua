
-- create center
DISPLAY_CENTER_X = display.contentCenterX
DISPLAY_CENTER_Y = display.contentCenterY
CONTENT_WIDTH = display.viewableContentWidth
CONTENT_HEIGHT = display.viewableContentHeight

storyboard = storyboard or require("storyboard")
widget = widget or require("widget")
storyboard.gotoScene("splashScene")

display.setStatusBar( display.HiddenStatusBar )