local wezterm = require('wezterm')

local config = wezterm.config_builder()

config.font = wezterm.font('JetBrainsMono Nerd Font Mono')
config.font_size = 11

config.enable_tab_bar = false

config.initial_cols = 180
config.initial_rows = 40

config.window_decorations = 'TITLE | RESIZE'

config.color_scheme = 'GruvboxDark'

config.window_background_opacity = 1.0
config.win32_system_backdrop = 'Disable'

--config.launch_menu = {
--    label = "VS 2022 Developer Powershell",
--    domain = {
--        name = "VS2022-PowerShell",
--        exec = full_cmd
--    }
--}
config.default_prog = { 'powershell.exe', '-NoLogo' }

return config
