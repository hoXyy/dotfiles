local wezterm = require("wezterm") --@type Wezterm
local config = wezterm.config_builder()
local ui = require("ui")

config.front_end = "WebGpu"

for k, v in pairs(ui) do
	config[k] = v
end

local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(config, {
	modules = {
		workspace = {
			enabled = false,
		},
		leader = {
			enabled = false,
		},
		hostname = {
			enabled = false,
		},
	},
})

return config
