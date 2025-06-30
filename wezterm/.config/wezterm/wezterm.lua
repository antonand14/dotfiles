local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

config.check_for_updates = true
config.term = "xterm-256color"
config.use_ime = true

wezterm.plugin.require("https://github.com/yriveiro/wezterm-status").apply_to_config(config, {
	cells = {
		battery = { enabled = false },
		date = { format = "%H:%M" },
        hostname = { enabled = false },
	},
})

----------------
-- Appearance --
----------------
config.window_background_opacity = 0.9
-- config.color_scheme = "Dracula (Official)"
-- config.color_scheme = "rose-pine-dawn"
config.color_scheme = "Gruvbox Material (Gogh)"
-- config.color_scheme = "rose-pine"
-- config.colors = {
--     background = "#000000"
-- }

config.window_padding = {
	left = 5,
	right = 1,
	top = 1,
	bottom = 1,
}

config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.7,
}

-----------
-- Tab bar --
-----------
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_max_width = 32

-- How many lines of scrollback you want to retain per tab
config.scrollback_lines = 5000
config.enable_scroll_bar = true

-----------
-- Fonts --
-----------
config.font = wezterm.font("JetBrains Mono")
config.font_size = 12.0

-----------
-- Keys  --
-----------
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
	-- Window management
	{ key = "a", mods = "LEADER|CTRL", action = act.SendKey({ key = "a", mods = "CTRL" }) },
	{ key = "-", mods = "LEADER", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "\\", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
	{ key = "c", mods = "LEADER", action = act({ SpawnTab = "CurrentPaneDomain" }) },

	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },

	{ key = "H", mods = "LEADER", action = act({ AdjustPaneSize = { "Left", 5 } }) },
	{ key = "J", mods = "LEADER", action = act({ AdjustPaneSize = { "Down", 5 } }) },
	{ key = "K", mods = "LEADER", action = act({ AdjustPaneSize = { "Up", 5 } }) },
	{ key = "L", mods = "LEADER", action = act({ AdjustPaneSize = { "Right", 5 } }) },

	{ key = "a", mods = "LEADER", action = act.ActivateLastTab },
	{ key = " ", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = "1", mods = "LEADER", action = act({ ActivateTab = 0 }) },
	{ key = "2", mods = "LEADER", action = act({ ActivateTab = 1 }) },
	{ key = "3", mods = "LEADER", action = act({ ActivateTab = 2 }) },
	{ key = "4", mods = "LEADER", action = act({ ActivateTab = 3 }) },
	{ key = "5", mods = "LEADER", action = act({ ActivateTab = 4 }) },
	{ key = "6", mods = "LEADER", action = act({ ActivateTab = 5 }) },
	{ key = "7", mods = "LEADER", action = act({ ActivateTab = 6 }) },
	{ key = "8", mods = "LEADER", action = act({ ActivateTab = 7 }) },
	{ key = "9", mods = "LEADER", action = act({ ActivateTab = 8 }) },
	{ key = "x", mods = "LEADER", action = act({ CloseCurrentPane = { confirm = true } }) },

	-- Activate Copy Mode
	{ key = "[", mods = "LEADER", action = act.ActivateCopyMode },
    -- Active command prompt
    { key = "d", mods = "LEADER", action = act.ActivateCommandPalette },
    -- Enter quick select mode
    { key = "s", mods = "LEADER", action = act.QuickSelect},
}

return config
