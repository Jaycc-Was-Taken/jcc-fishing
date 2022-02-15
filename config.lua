Config = {}
Config = {
	Blips = true,
	BlipNamer = true,
	Pedspawn = true,
	Invincible = true,
	Frozen = true,
	Stoic = true,
	Fade = true,
	Distance = 40.0,
}
Config.Locations = {
    ['FreshwaterSale'] = { name = "Freshwater Fish Sales", location = vector3(1309.44, 4361.93, 41.54-0.99), heading = 257.77, blipTrue = true},
    ['SaltwaterSale'] = { name = "Saltwater Fish Sales", location = vector3(-1593.17, 5196.79, 4.36-0.99), heading = 31.36, blipTrue = true},
}
Config.PedList = {
	{ model = "s_m_m_migrant_01", coords = Config.Locations['FreshwaterSale'].location, heading = Config.Locations['FreshwaterSale'].heading, gender = "male", scenario = "WORLD_HUMAN_CLIPBOARD", }, -- Alamo Sea Dock area
	{ model = "s_m_m_migrant_01", coords = Config.Locations['SaltwaterSale'].location, heading = Config.Locations['SaltwaterSale'].heading, gender = "male", scenario = "WORLD_HUMAN_CLIPBOARD", }, -- Chumash Dock Area

}
Config.FreshwaterItems = {
    label = "Freshwater Fishing Store",  slots = 5,
    items = {
	[1] = { name = "water_bottle",  price = 15, amount = 100, info = {}, type = "item", slot = 1, },
	[2] = { name = "sandwich",      price = 15, amount = 250, info = {}, type = "item", slot = 2, },
	[3] = { name = "bandage",       price = 50, amount = 100, info = {}, type = "item", slot = 3, },
	[4] = { name = "redwiggler",    price = 10, amount = 100, info = {}, type = "item", slot = 4, }, 
	[5] = { name = "fishingrod",    price = 250, amount = 100, info = {}, type = "item", slot = 5, }, 
    }
}
Config.SaltwaterItems = {
    label = "Saltwater Fishing Store",  slots = 5,
    items = {
	[1] = { name = "water_bottle",  price = 15, amount = 100, info = {}, type = "item", slot = 1, },
	[2] = { name = "sandwich",      price = 15, amount = 250, info = {}, type = "item", slot = 2, },
	[3] = { name = "bandage",       price = 50, amount = 100, info = {}, type = "item", slot = 3, },
	[4] = { name = "redwiggler",    price = 10, amount = 100, info = {}, type = "item", slot = 4, }, 
	[5] = { name = "fishingrod",    price = 250, amount = 100, info = {}, type = "item", slot = 5, }, 
    }
}
Config.FreshwaterBait = {
    'redwiggler'
}
Config.SaltwaterBait = {
    'redwiggler'
}
Config.FreshWaterFish = {
    "rainbowtrout",
    "stripedbass",
    "largemouthbass",
    "smallmouthbass",
    "sunfish",
    "blackcrappie",
    "walleye",
    "pickerel",
    "channelcatfish"
}
Config.RareFreshWaterFish = {
    "chinooksalmon",
    "cohosalmon",
    "muskellunge",
    "bluecatfish",
    "flatheadcatfish",
    "paddlefish"
}
Config.IllegalFreshWaterFish = {
    "alligatorgar",
}
Config.SaltWaterFish = {
    "bonefish",
    "wahoo",
    "bluefish",
    "mackerel",
    "flounder",
    "yellowtail",
    "redsnapper",
    "tarpon"
}
Config.RareSaltWaterFish = {
    "blackfintuna",
    "mahimahi",
    "crevallejack",
    "reddrum",
    "bluefintuna"
}
Config.IllegalSaltWaterFish = {
    "blacktipshark",
    "makoshark",
    "blackmarlin"
}
Config.SellFish = {
    ["rainbowtrout"] = 10,
    ["stripedbass"] = 10,
    ["largemouthbass"] = 10,
    ["smallmouthbass"] = 10,
    ["sunfish"] = 10,
    ["blackcrappie"] = 10,
    ["walleye"] = 10,
    ["pickerel"] = 10,
    ["channelcatfish"] = 10,
    ["chinooksalmon"] = 10,
    ["cohosalmon"] = 10,
    ["muskellunge"] = 10,
    ["bluecatfish"] = 10,
    ["flatheadcatfish"] = 10,
    ["paddlefish"] = 10,
    ["alligatorgar"] = 10,
    ["bonefish"] = 10,
    ["wahoo"] = 10,
    ["bluefish"] = 10,
    ["mackerel"] = 10,
    ["flounder"] = 10,
    ["yellowtail"] = 10,
    ["redsnapper"] = 10,
    ["tarpon"] = 10,
    ["blackfintuna"] = 10,
    ["mahimahi"] = 10,
    ["crevallejack"] = 10,
    ["reddrum"] = 10,
    ["bluefintuna"] = 10,
    ["blacktipshark"] = 10,
    ["makoshark"] = 10,
    ["blackmarlin"] = 10,
}
Config.FreshWaterHotspots = { -- Doesn't currently do anything soon though (winter 2017 kind of soon)
    [1] = { 
        ["coords"] = vector2(1280.30, 4221.21),
        ["radius"] = 108.87,
        ["name"] = "hotspot1"
    }, 
    [2] = {
        ["coords"] = vector2(668.18, 3984.85),
        ["radius"] = 114.13,
        ["name"] = "hotspot2"
    },
    [3] = {
        ["coords"] = vector2(2037.88, 4169.70),
        ["radius"] = 102.77,
        ["name"] = "hotspot3"
    },
}