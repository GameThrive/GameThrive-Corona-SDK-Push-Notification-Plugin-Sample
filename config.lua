application = {
	content = {
		width = 320,
		height = 480, 
		scale = "letterBox",
		fps = 30,
		
		--[[
        imageSuffix = {
		    ["@2x"] = 2,
		}
		--]]
	},

   
    -- Push notifications
    notification =
    {
		google =
        {
            projectNumber = "703322744261"
        },
        iphone =
        {
            types =
            {
                "badge", "sound", "alert"
            }
        },
    } 
}
