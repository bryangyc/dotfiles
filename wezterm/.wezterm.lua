
local wezterm = require("wezterm")

local config = wezterm.config_builder()
local act = wezterm.action
local mod = {}

config.default_prog = { 'C:\\Program Files\\Git\\bin\\bash.exe', '-l' }
-- if wezterm.target_triple == "x86_64-pc-windows-msvc" then
-- 	config.default_domain = "WSL:Ubuntu"
-- end

config.color_scheme = "Tokyo Night"
-- config.window_background_opacity = 0.8

config.font = wezterm.font("MesloLGS NF")
config.font_size = 12

config.warn_about_missing_glyphs = false


mod.SUPER = 'ALT'
mod.SUPER_REV = 'ALT|CTRL'

local keys = {
    { key = 'c', mods = 'CTRL|SHIFT', action = act.CopyTo('Clipboard') },
    { key = 'v', mods = 'CTRL|SHIFT', action = act.PasteFrom('Clipboard') },

    -- tabs --
    { key = 't', mods = mod.SUPER, action= act.SpawnTab('DefaultDomain')},
    { key = 'w', mods = mod.SUPER_REV, action = act.CloseCurrentTab({ confirm = true}) },

    -- split panes
    { key = [[-]], mods = mod.SUPER, action = act.SplitVertical({ domain = 'CurrentPaneDomain' })},
    { key = [[\]], mods = mod.SUPER, action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' })},
    -- close panes
    { key = 'w', mods = mod.SUPER, action = act.CloseCurrentPane({ confirm = true })},


    -- panes navigation
    { key = 'k', mods = mod.SUPER_REV, action = act.ActivatePaneDirection('Up')},
    { key = 'j', mods = mod.SUPER_REV, action = act.ActivatePaneDirection('Down')},
    { key = 'h', mods = mod.SUPER_REV, action = act.ActivatePaneDirection('Left')},
    { key = 'l', mods = mod.SUPER_REV, action = act.ActivatePaneDirection('Right')},


    -- scroll panes
    { key = 'u', mods = mod.SUPER, action = act.ScrollByLine(-5) },
    { key = 'd', mods = mod.SUPER, action = act.ScrollByLine(5) },
    { key = 'PageUp', mods = 'NONE', action = act.ScrollByPage(-0.75)},
    { key = 'PageDown', mods = 'NONE', action = act.ScrollByPage(0.75)},

}

config.keys = keys

return config
