local wezterm = require("wezterm")

return {
	font_size = 14,
	font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "DemiBold", stretch = "Normal" }),
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	-- hide_tab_bar_if_only_one_tab = true,
	color_scheme = "OneDark (base16)",
	cursor_blink_rate = 500,
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
}
