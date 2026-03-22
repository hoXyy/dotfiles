local wezterm = require("wezterm") ---@type Wezterm

local colors = {
	bg = "#1e1e2e",
	surface0 = "#313244",
	pink = "#89b4fa", -- The highlight color from your screenshot
	text = "#cdd6f4",
	subtext0 = "#a6adc8",
}

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab.active_pane.title
	local id = tab.tab_index + 1

	-- Add the indicator based on active status
	local suffix = ""
	if tab.is_active then
		suffix = " *"
	else
		suffix = " -"
	end

	-- Return the string with padding
	return {
		{ Text = "  " .. id .. " " .. title .. suffix .. "  " },
	}
end)

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
			-- Inactive tabs
			inactive_tab = {
				bg_color = colors.bg,
				fg_color = colors.pink, -- Pink text for inactive numbers/titles
			},
			-- Active tab (Solid pink block with dark text)
			active_tab = {
				bg_color = colors.pink,
				fg_color = colors.bg,
			},
			-- Hovering over a tab
			inactive_tab_hover = {
				bg_color = colors.surface0,
				fg_color = colors.text,
			},
			-- The "new tab" button (+)
			new_tab = {
				bg_color = colors.bg,
				fg_color = colors.text,
			},
		},
	},
}
