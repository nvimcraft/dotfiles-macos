local wezterm = require("wezterm")

local M = {}

M.spec = {
	enable_tab_bar = false,
	font_size = 18,
	font = wezterm.font_with_fallback({ "CaskaydiaCove Nerd Font" }),
	macos_window_background_blur = 10,
	window_background_opacity = 1,
	window_decorations = "RESIZE",
	scrollback_lines = 10000,

	colors = {
		-- Kaso (ink)
		foreground = "#C5C9C7",
		background = "#090E13",

		cursor_bg = "#C4746E",
		cursor_fg = "#C5C9C7",
		cursor_border = "#C5C9C7",

		selection_fg = "#C5C9C7",
		selection_bg = "#22262D",

		scrollbar_thumb = "#22262D",
		split = "#22262D",

		ansi = {
			"#090E13",
			"#C4746E",
			"#8A9A7B",
			"#C4B28A",
			"#8BA4B0",
			"#A292A3",
			"#8EA4A2",
			"#A4A7A4",
		},
		brights = {
			"#A4A7A4",
			"#E46876",
			"#87A987",
			"#E6C384",
			"#7FB4CA",
			"#938AA9",
			"#7AA89F",
			"#C5C9C7",
		},
	},
}

return M.spec
