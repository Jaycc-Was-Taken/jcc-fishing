# I NO LONGER SUPPORT/UPDATE THIS

## A Fishing Script for QBCore Framework
Features :
- Runs at 0.00ms normally, and at 0.01ms while fishing.
- Large variety of fish.
- Different fish for freshwater and saltwater areas.
- Fishing off of boats, docks, or land.

## Dependencies :
- QB Framework
- PolyZone
- qb-target

## Preview :
- https://www.youtube.com/watch?v=5FLmww5DNt4
# Thanks :
- Google for the images.
- Thanks to Jimathy, he posted his scripts and I learned a lot with how to spawn peds and such in a really nice way, he has a lot of really good stuff at https://github.com/jimathy
- Thanks to vrp fishing for some animations and prop placement stuff, really cool stuff that really helped. https://github.com/OriginalGamers/vrp_fishing_animations/blob/master/vrp_fishing_animations/client.lua originally found https://forum.cfx.re/t/release-vrp-fishing-animations/109707


### This goes in your Shared lua, wherever you put items. There are images for all the fish in the images folder. You'll want to set the weights to fit your servers pocket size and economy. Make sure to also play around with the fish prices as they are just a default $10 per fish.

		["fishingrod"] = {["name"] = "fishingrod", 					["label"] = "Fishing Rod", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "fishingrod.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	    ["combinable"] = nil,   ["description"] = "A fishing rod."},
		["rainbowtrout"] = {["name"] = "rainbowtrout",				["label"] = "Rainbow Trout",			["weight"] = 1000, 		["type"] = "item", 		["image"] = "rainbowtrout.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	    ["combinable"] = nil,   ["description"] = "A rainbow trout."},
		["stripedbass"] = {["name"] = "stripedbass",				["label"] = "Striped Bass",				["weight"] = 1000, 		["type"] = "item", 		["image"] = "stripedbass.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	    ["combinable"] = nil,   ["description"] = "A striped bass."},
		["largemouthbass"] = {["name"] = "largemouthbass",			["label"] = "Largemouth Bass",			["weight"] = 1000, 		["type"] = "item", 		["image"] = "largemouthbass.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	    ["combinable"] = nil,   ["description"] = "A largemouthed bass."},
		["smallmouthbass"] = {["name"] = "smallmouthbass",			["label"] = "Smallmouth Bass",			["weight"] = 1000, 		["type"] = "item", 		["image"] = "smallmouthbass.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	    ["combinable"] = nil,   ["description"] = "A smallmouthed bass."},
		["sunfish"] = {["name"] = "sunfish",						["label"] = "Sunfish",					["weight"] = 1000, 		["type"] = "item", 		["image"] = "sunfish.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	    ["combinable"] = nil,   ["description"] = "A sunfish."},
		["blackcrappie"] = {["name"] = "blackcrappie",				["label"] = "Black Crappie",			["weight"] = 1000, 		["type"] = "item", 		["image"] = "blackcrappie.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	    ["combinable"] = nil,   ["description"] = "A blackcrappie."},
		["walleye"] = {["name"] = "walleye",						["label"] = "walleye",					["weight"] = 1000, 		["type"] = "item", 		["image"] = "walleye.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	    ["combinable"] = nil,   ["description"] = "A walleye."},
		["pickerel"] = {["name"] = "pickerel",						["label"] = "Pickerel",					["weight"] = 1000, 		["type"] = "item", 		["image"] = "pickerel.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	    ["combinable"] = nil,   ["description"] = "A pickerel."},
		["channelcatfish"] = {["name"] = "channelcatfish",			["label"] = "Channel Catfish",			["weight"] = 1000, 	["type"] = "item", 		["image"] = "channelcatfish.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "A channel catfish."},
		["chinooksalmon"] = {["name"] = "chinooksalmon",			["label"] = "Chinook Salmon",			["weight"] = 1000, 	["type"] = "item", 		["image"] = "chinooksalmon.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "A chinook salmon."},
		["cohosalmon"] = {["name"] = "cohosalmon",					["label"] = "Coho Salmon",				["weight"] = 1000, 	["type"] = "item", 		["image"] = "cohosalmon.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "A coho salmon."},
		["muskellunge"] = {["name"] = "muskellunge",				["label"] = "Muskellunge",				["weight"] = 1000, 	["type"] = "item", 		["image"] = "muskellunge.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "A muskellunge."},
		["bluecatfish"] = {["name"] = "bluecatfish",				["label"] = "Blue Catfish",				["weight"] = 1000, 	["type"] = "item", 		["image"] = "bluecatfish.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "A Blue Catfish."},
		["flatheadcatfish"] = {["name"] = "flatheadcatfish",		["label"] = "Flathead Catfish",			["weight"] = 1000, 	["type"] = "item", 		["image"] = "flatheadcatfish.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "A flathead catfish."},
		["paddlefish"] = {["name"] = "paddlefish",					["label"] = "Paddlefish",				["weight"] = 1000, 	["type"] = "item", 		["image"] = "paddlefish.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "A paddlefish."},
		["alligatorgar"] = {["name"] = "alligatorgar",				["label"] = "Alligator Gar",			["weight"] = 1000, 	["type"] = "item", 		["image"] = "alligatorgar.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "An alligator gar."},
		["bonefish"] = {["name"] = "bonefish",						["label"] = "Bonefish",					["weight"] = 1000, 		["type"] = "item", 		["image"] = "bonefish.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "A bonefish."},
		["wahoo"] = {["name"] = "wahoo",							["label"] = "Wahoo",					["weight"] = 1000, 	["type"] = "item", 		["image"] = "wahoo.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "A wahoo."},
		["bluefish"] = {["name"] = "bluefish",						["label"] = "Bluefish",					["weight"] = 1000, 	["type"] = "item", 		["image"] = "bluefish.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "A bluefish."},
		["mackerel"] = {["name"] = "mackerel",						["label"] = "Mackerel",					["weight"] = 1000, 		["type"] = "item", 		["image"] = "mackerel.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "A mackerel."},
		["flounder"] = {["name"] = "flounder",						["label"] = "Flounder",					["weight"] = 1000, 		["type"] = "item", 		["image"] = "flounder.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "A flounder."},
		["blackfintuna"] = {["name"] = "blackfintuna",				["label"] = "Blackfin Tuna",			["weight"] = 1000, 	["type"] = "item", 		["image"] = "blackfintuna.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "A blackfin tuna."},
		["yellowtail"] = {["name"] = "yellowtail",					["label"] = "Yellowtail Snapper",		["weight"] = 1000, 	["type"] = "item", 		["image"] = "yellowtail.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "A yellowtail snapper."},
		["redsnapper"] = {["name"] = "redsnapper",					["label"] = "Red Snapper",				["weight"] = 1000, 	["type"] = "item", 		["image"] = "redsnapper.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "A red snapper."},
		["mahimahi"] = {["name"] = "mahimahi",						["label"] = "Mahi Mahi",				["weight"] = 1000, 	["type"] = "item", 		["image"] = "mahimahi.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "A mahi mahi."},
		["tarpon"] = {["name"] = "tarpon",							["label"] = "Tarpon",					["weight"] = 1000, 	["type"] = "item", 		["image"] = "tarpon.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "A tarpon."},
		["crevallejack"] = {["name"] = "crevallejack",				["label"] = "Crevalle Jack",			["weight"] = 1000, 	["type"] = "item", 		["image"] = "crevallejack.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "A crevalle jack."},
		["reddrum"] = {["name"] = "reddrum",						["label"] = "Red Drum",					["weight"] = 1000, 	["type"] = "item", 		["image"] = "reddrum.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "A red drum."},
		["bluefintuna"] = {["name"] = "bluefintuna",				["label"] = "Bluefin Tuna",				["weight"] = 1000, 	["type"] = "item", 		["image"] = "bluefintuna.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "A bluefin tuna."},
		["blacktipshark"] = {["name"] = "blacktipshark",			["label"] = "Blacktip shark",			["weight"] = 1000, 	["type"] = "item", 		["image"] = "blacktip.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "A blacktip shark."},
		["makoshark"] = {["name"] = "makoshark",					["label"] = "Mako Shark",				["weight"] = 1000, 	["type"] = "item", 		["image"] = "makoshark.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "A mako shark."},
		["blackmarlin"] = {["name"] = "blackmarlin",				["label"] = "Black Marlin",				["weight"] = 1000, 	["type"] = "item", 		["image"] = "blackmarlin.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "A black marlin."},
		["redwiggler"] = { ["name"] = "redwiggler",					["label"] = "Red Wiggler",				["weight"] = 250, 		["type"] = "item", 		["image"] = "redwiggler.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "A fresh red wiggler worm."},
