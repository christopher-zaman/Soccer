-- 
-- Abstract: Bouncing fruit, using enterFrame listener for animation

------------------------------------------------------------
--display.setStatusBar( display.HiddenStatusBar )
local xpos = display.contentCenterX
local ypos = display.contentCenterY

local background = display.newImage( "field.jpg", xpos, ypos )

local radius = 40

local xdirection = 1
local ydirection = 1

local xspeed = 7.5
local yspeed = 6.4

local fruit = display.newImage( "ball.png", xpos, ypos )

-- Get current edges of visible screen (accounting for the areas cropped by "zoomEven" scaling mode in config.lua)
local screenTop = display.screenOriginY
local screenBottom = display.viewableContentHeight + display.screenOriginY
local screenLeft = display.screenOriginX
local screenRight = display.viewableContentWidth + display.screenOriginX

local function animate(event)
	xpos = xpos + ( xspeed * xdirection );
	ypos = ypos + ( yspeed * ydirection );

	if ( xpos > screenRight - radius or xpos < screenLeft + radius ) then
		xdirection = xdirection * -1;
	end
	if ( ypos > screenBottom - radius or ypos < screenTop + radius ) then
		ydirection = ydirection * -1;
	end

	fruit:translate( xpos - fruit.x, ypos - fruit.y)
end

Runtime:addEventListener( "enterFrame", animate );
    