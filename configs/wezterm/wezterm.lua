local wezterm = require("wezterm") ---@type Wezterm
local config = wezterm.config_builder()
local ui = require("ui")

config.front_end = "WebGpu"

for k, v in pairs(ui) do
	config[k] = v
end

return config
