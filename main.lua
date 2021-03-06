-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Require the widget library
local widget = require( "widget" )

print("START!")

-- This function gets called when the player opens a notification or one is received when the app is open and active.
function DidReceiveRemoteNotification(message, additionalData, isActive)
    if (additionalData) then
        if (additionalData.discount) then
            native.showAlert( "Discount!", message, { "OK" } )
            -- Take player to your game store
        elseif(additionalData.bonusCredits) then
            native.showAlert( "Bonus Credits!", message, { "OK" } )
            -- Add credits and take player your game store or inventory if you like
        elseif(additionalData.actionSelected) then -- Interactive notification button pressed
            native.showAlert("Button Pressed!", "ButtonID:" .. additionalData.actionSelected, { "OK"} )
        end
    end
end

local GameThrive = require("plugin.GameThrivePushNotifications")
GameThrive.Init("38cb8448-c5a2-11e3-8258-57d3216d919f", "596126209634", DidReceiveRemoteNotification)

-- START: Tags button
local buttonHandlerSendTags = function( event )
	GameThrive.TagPlayer("CoronaTag1", "value1")
	GameThrive.TagPlayerWithTable({["CoronaTag2"] = "value2",["CoronaTag3"] = "value3"})
end

local tagsButton = widget.newButton
{
	id = "SendTags",
	defaultFile = "buttonGray.png",
	overFile = "buttonWhite.png",
	label = "Send Tags",
	font = native.systemFont,
	labelColor =  { default={ 1, 1, 1 }},
	fontSize = 28,
	emboss = true,
	onPress = buttonHandlerSendTags,
}
tagsButton.x = 160; tagsButton.y = 100
-- END: Tags button


-- START: Purchase button
local buttonHandlerSendPurchase = function( event )
	GameThrive.PlayerPurchase(12.34)
end

local purchaseButton = widget.newButton
{
	id = "SendPurchase",
	defaultFile = "buttonGray.png",
	overFile = "buttonWhite.png",
	label = "Send purchase",
	font = native.systemFont,
	labelColor =  { default={ 1, 1, 1 }},
	fontSize = 28,
	emboss = true,
	onPress = buttonHandlerSendPurchase,
}
purchaseButton.x = 160; purchaseButton.y = 200
-- END: Purchase button

