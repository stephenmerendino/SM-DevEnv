local wezterm = require('wezterm')
local act = wezterm.action

local config = wezterm.config_builder()

config.automatically_reload_config = true
config.font = wezterm.font('JetBrainsMono Nerd Font Mono')
config.font_size = 11

config.initial_cols = 150
config.initial_rows = 40

config.window_decorations = 'RESIZE'

config.color_scheme = 'GruvboxDark'

config.window_background_opacity = 0.8
config.win32_system_backdrop = 'Acrylic'

config.default_prog = { 'powershell.exe', '-NoLogo' }

config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

config.leader = { key = "b", mods = "CTRL", timeout_milliseconds=2000 }
config.keys = {
    { key = "o", mods = "LEADER",       action="TogglePaneZoomState" },

    { key = "%", mods = "LEADER|SHIFT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    { key = '\"',mods = "LEADER|SHIFT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    { key = "s", mods = "LEADER",       action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    { key = "v", mods = "LEADER",       action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},

    { key = "t", mods = "LEADER",       action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
    { key = "h", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Left"}},
    { key = "j", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Down"}},
    { key = "k", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Up"}},
    { key = "l", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Right"}},
    { key = "H", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Left", 5}}},
    { key = "J", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Down", 5}}},
    { key = "K", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Up", 5}}},
    { key = "L", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Right", 5}}},

    { key = "1", mods = "LEADER",       action=wezterm.action{ActivateTab=0}},
    { key = "2", mods = "LEADER",       action=wezterm.action{ActivateTab=1}},
    { key = "3", mods = "LEADER",       action=wezterm.action{ActivateTab=2}},
    { key = "4", mods = "LEADER",       action=wezterm.action{ActivateTab=3}},
    { key = "5", mods = "LEADER",       action=wezterm.action{ActivateTab=4}},
    { key = "6", mods = "LEADER",       action=wezterm.action{ActivateTab=5}},
    { key = "7", mods = "LEADER",       action=wezterm.action{ActivateTab=6}},
    { key = "8", mods = "LEADER",       action=wezterm.action{ActivateTab=7}},
    { key = "9", mods = "LEADER",       action=wezterm.action{ActivateTab=8}},

    { key = "W", mods = "LEADER|SHIFT", action=wezterm.action{CloseCurrentTab={confirm=true}}},
    { key = "w", mods = "LEADER",       action=wezterm.action{CloseCurrentPane={confirm=true}}},

    {
        key = '0',
        mods = 'LEADER',
        action = act.PaneSelect {
            mode = 'SwapWithActive',
        },
    },
}

return config
