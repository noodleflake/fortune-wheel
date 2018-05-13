-- @Author: Christian Youngblood <martinswanepoel>
-- @Date:   2018-05-13T16:27:44+02:00
-- @Email:  christian.youngblood@trilogix.co.za
-- @Project: Fortune Wheel
--
-- @Last modified by:   martinswanepoel
-- @Last modified time: 2018-05-13T20:55:10+02:00


local _M = {
    buttons = {
        continue = {
            normal = {
                filename = "assets/images/buttons/sp-button-continue-normal.png",
                width = 0,
                height = 0,
            },
            press = {
                filename = "assets/images/buttons/sp-button-continue-press.png",
                width = 0,
                height = 0,
            },
        },
        lobby = {
            normal = {
                filename = "assets/images/buttons/gp-button-lobby-normal.png",
                width = 160,
                height = 55,
            },
            press = {
                filename = "assets/images/buttons/gp-button-lobby-press.png",
                width = 160,
                height = 55,
            },
        },
        settings = {
            normal = {
                filename = "assets/images/buttons/gp-button-settings-normal.png",
                width = 67,
                height = 55,
            },
            press = {
                filename = "assets/images/buttons/gp-button-settings-press.png",
                width = 67,
                height = 55,
            },
        },
        shop = {
            normal = {
                filename = "assets/images/buttons/gp-button-shop-normal.png",
                width = 146,
                height = 55,
            },
            press = {
                filename = "assets/images/buttons/gp-button-shop-press.png",
                width = 146,
                height = 55,
            },
        },
    },
    backgrounds = {
        menu = {
            filename = "assets/images/backgrounds/sp-bg.png",
            width = 1200,
            height = 800,
        }
    },
    layers = {
        topPanel = {
            filename = "assets/images/layers/gp-top-panel.png",
            width = 1200,
            height = 96,
        }
    },
    sounds = {
        spin = {
            filename = "",
        }
    },
    music = {
        main = {
            filename = "",
        }
    }
}

return _M

--
-- local function shallowmerge(source, destination)
--     for k, v in pairs(source) do
-- 		if type(v) == 'number' or type(v) == 'string' or type(v) == 'boolean' then
-- 			destination[k] = v
--         end
--     end
--     return destination
-- end
