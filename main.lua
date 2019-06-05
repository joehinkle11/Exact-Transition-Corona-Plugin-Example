--
-- Abstract: etransition Library Plugin Test Project
--
-- This is an example Corona Project documenting how
-- to use the Exact Transition library.
--
-- Created by Joseph Hinkle
--
------------------------------------------------------------

-- Load plugin library
local eTransition = require "plugin.etransition"
local widget = require("widget")

-- screen positioning
local screenW = display.contentWidth
local screenH = display.contentHeight
local screenAW = display.actualContentWidth
local screenAH = display.actualContentHeight
local screenCX = display.contentCenterX
local screenCY = display.contentCenterY
local screenLeft = -(screenAW-screenW)*.5
local screenRight = screenAW-(screenAW-screenW)*.5
local screenTop = -(screenAH-screenH)*.5
local screenBottom = screenAH-(screenAH-screenH)*.5

local background = display.newRect( screenCX, screenCY, screenAW, screenAH )
background:setFillColor( 1 )

local ball = display.newCircle( -1000, (screenTop + screenCY)*.5, 25 )
ball:setFillColor( 0, .682, 1 )

local myTime = 0
local button
button = widget.newButton({
    left = screenLeft + 25,
    top = screenBottom - 300,
    width = screenAW - 50,
    height = 300,
    label = "Click to start!",
    onRelease = function()
        eTransition.set(
            ball,
            {
                time = 1000,
                timeElapsed = myTime,
                transition = easing.outQuad,
                x = screenRight,
                iterations = -1
            },
            {
                x = screenLeft
            }
        )
        myTime = myTime + 100
        button:setLabel("eTransition.set(\n\tball,\n\t{\n\t\ttime = 1000,\n\t\ttransition = easing.outQuad,\n\t\ttimeElapsed = " .. myTime .. ",\n\t\tx = screenRight,\n\t\titerations = -1\n\t},\n\t{\n\t\tx = screenLeft\n\t}\n)")
    end
})