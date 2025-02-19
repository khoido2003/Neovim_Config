local wezterm = require("wezterm")
local gpus = wezterm.gui.enumerate_gpus()

local config = {
	show_close_tab_button_in_tabs = false,

	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},

	window_decorations = "INTEGRATED_BUTTONS|RESIZE",

	enable_scroll_bar = false,
	color_scheme = "Hardcore (base16)",

	-- Font settings
	font = wezterm.font("Fira Code"),

	font_size = 11,

	window_close_confirmation = "NeverPrompt",
	scrollback_lines = 500,

	-- ////////////////////////////////

	front_end = "WebGpu",
	webgpu_power_preference = "HighPerformance",

	webgpu_preferred_adapter = gpus[2],

	webgpu_force_fallback_adapter = false,

	max_fps = 60,

	allow_square_glyphs_to_overflow_width = "Always",

	-- default_prog = { "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe", "-NoLogo" },

	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },

	keys = {
		{ key = "h", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "|", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "x", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
	},
}

-- Tab renaming function
wezterm.on("format-tab-title", function(tab)
	return " " .. tostring(tab.tab_index + 1) .. " "
end)

return config
