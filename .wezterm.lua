local wezterm = require("wezterm")

local M = {}

M.spec = {
	enable_tab_bar = false,
	font_size = 18,
	font = wezterm.font_with_fallback({ "Lilex Nerd Font" }),
	macos_window_background_blur = 10,
	window_background_opacity = 1,
	window_decorations = "RESIZE",
	scrollback_lines = 10000,

	colors = {
		-- Everforest (Dark (Hard)
		foreground = "#d3c6aa",
		background = "#272e33",

		cursor_bg = "#d3c6aa",
		cursor_fg = "#272e33",
		cursor_border = "#d3c6aa",

		selection_bg = "#414b50",
		selection_fg = "#d3c6aa",

		ansi = {
			"#414b50",
			"#e67e80",
			"#a7c080",
			"#dbbc7f",
			"#7fbbb3",
			"#d699b6",
			"#83c092",
			"#d3c6aa",
		},

		brights = {
			"#859289",
			"#e67e80",
			"#a7c080",
			"#dbbc7f",
			"#7fbbb3",
			"#d699b6",
			"#83c092",
			"#fdf6e3",
		},
	},
}

return M.spec
