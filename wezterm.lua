-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.window_background_opacity = 0.7
-- config.window_background_opacity = 0.95
config.colors = {
	-- foreground = "white",
	-- background = "#D13ABD",
}
-- config.window_background_gradient = {
-- 	orientation = {
-- 		Linear = {
-- 			angle = -45.00,
-- 		},
-- 	},
-- 	colors = {
-- 		"#EC6EAD",
-- 		"#3494E6",
-- 		-- "#000000",
-- 		-- "#EEBD89",
-- 		-- "#D13ABD",
-- 		-- "#000000",
-- 	},
-- 	-- interpolation = "Basis",
-- 	-- noise = 100,
-- 	-- segment_size = 5,
-- 	-- segment_smoothness = 0.5,
-- }
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold", italic = true })
config.font_size = 16
config.keys = {}
config.enable_tab_bar = false
config.enable_scroll_bar = false
config.disable_default_mouse_bindings = true
config.mouse_wheel_scrolls_tabs = true

-- Spawn a fish shell in login mode
config.default_prog = { "/opt/homebrew/bin/fish" }

-- and finally, return the configuration to wezterm
return config
