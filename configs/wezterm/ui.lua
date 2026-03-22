local wezterm = require("wezterm") ---@type Wezterm

local colors = {
	bg = "#1e1e2e",
	surface0 = "#313244",
	pink = "#89b4fa",
	text = "#cdd6f4",
	subtext0 = "#a6adc8",
}

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab.active_pane.title
	local id = tab.tab_index + 1

	local suffix = ""
	if tab.is_active then
		suffix = " *"
	else
		suffix = " -"
	end

	return {
		{ Text = "  " .. id .. " " .. title .. suffix .. "  " },
	}
end)

---@type Config
return {
	font_size = 14,
	font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "DemiBold", stretch = "Normal" }),
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	tab_max_width = 32,
	-- hide_tab_bar_if_only_one_tab = true,
	color_scheme = "Catppuccin Mocha",
	cursor_blink_rate = 500,
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	colors = {
		tab_bar = {
			background = colors.bg,
			inactive_tab = {
				bg_color = colors.bg,
				fg_color = colors.pink,
			},
			active_tab = {
				bg_color = colors.pink,
				fg_color = colors.bg,
			},
			inactive_tab_hover = {
				bg_color = colors.surface0,
				fg_color = colors.text,
			},
			new_tab = {
				bg_color = colors.bg,
				fg_color = colors.text,
			},
		},
	},
}
