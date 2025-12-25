local wezterm = require('wezterm')

local config = wezterm.config_builder()

config.automatically_reload_config = true
config.font = wezterm.font('JetBrainsMono Nerd Font Mono')
config.font_size = 11

--config.enable_tab_bar = false

config.initial_cols = 150
config.initial_rows = 40

config.window_decorations = 'TITLE | RESIZE'

config.color_scheme = 'GruvboxDark'

config.window_background_opacity = 0.8
config.win32_system_backdrop = 'Acrylic'

config.default_prog = { 'powershell.exe', '-NoLogo' }

return config
