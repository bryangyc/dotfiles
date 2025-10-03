
local wezterm = require("wezterm")

local config = wezterm.config_builder()
local act = wezterm.action
local mod = {}

config.default_prog = { 'C:\\Program Files\\Git\\bin\\bash.exe', '-l' }
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
    config.default_prog = { 'C:\\Program Files\\Git\\bin\\bash.exe', '-l' }
else
    config.default_prog = { os.getenv("SHELL") or "/bin/bash" }
end

config.color_scheme = "Gruvbox Dark (Gogh)"
-- config.window_background_opacity = 0.8

config.font = wezterm.font("MesloLGS NF")
config.font_size = 11

config.warn_about_missing_glyphs = false

-- Seamless navigation between WezTerm panes and Neovim splits
local function nvim_or_wezterm(dir, key)
  return act.Multiple {
    act.ActivatePaneDirection(dir),
    act.SendKey { key = key, mods = "CTRL" }, -- fallback to nvim
  }
end

mod.SUPER = 'ALT'
mod.SUPER_REV = 'ALT|CTRL'

local keys = {
    { key = 'c', mods = 'CTRL|SHIFT', action = act.CopyTo('Clipboard') },
    { key = 'v', mods = 'CTRL|SHIFT', action = act.PasteFrom('Clipboard') },

    -- tabs --
    { key = 't', mods = mod.SUPER, action= act.SpawnTab('DefaultDomain')},
    { key = 'w', mods = mod.SUPER_REV, action = act.CloseCurrentTab({ confirm = true}) },

    { key = '[', mods = mod.SUPER, action = act.ActivateTabRelative(-1) },
    { key = ']', mods = mod.SUPER, action = act.ActivateTabRelative(1) },

    -- split panes
    { key = [[\]], mods = mod.SUPER, action = act.SplitVertical({ domain = 'CurrentPaneDomain' })},
    { key = [[-]], mods = mod.SUPER, action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' })},
    -- close panes
    { key = 'w', mods = mod.SUPER, action = act.CloseCurrentPane({ confirm = true })},


    -- panes navigation
    { key = 'k', mods = mod.SUPER, action = act.ActivatePaneDirection('Up')},
    { key = 'j', mods = mod.SUPER, action = act.ActivatePaneDirection('Down')},
    { key = 'h', mods = mod.SUPER, action = act.ActivatePaneDirection('Left')},
    { key = 'l', mods = mod.SUPER, action = act.ActivatePaneDirection('Right')},

	--  -- panes navigation (CTRL only, seamless with Neovim)
	--    { key = 'h', mods = 'CTRL', action = act.Multiple {
	-- act.ActivatePaneDirection 'Left',
	-- act.SendKey { key = 'h', mods = 'CTRL' },
	--    }},
	--    { key = 'j', mods = 'CTRL', action = act.Multiple {
	-- act.ActivatePaneDirection 'Down',
	-- act.SendKey { key = 'j', mods = 'CTRL' },
	--    }},
	--    { key = 'k', mods = 'CTRL', action = act.Multiple {
	-- act.ActivatePaneDirection 'Up',
	-- act.SendKey { key = 'k', mods = 'CTRL' },
	--    }},
	--    { key = 'l', mods = 'CTRL', action = act.Multiple {
	-- act.ActivatePaneDirection 'Right',
	-- act.SendKey { key = 'l', mods = 'CTRL' },
	--    }},

    -- scroll panes
    { key = 'u', mods = mod.SUPER, action = act.ScrollByLine(-5) },
    { key = 'd', mods = mod.SUPER, action = act.ScrollByLine(5) },
    { key = 'PageUp', mods = 'NONE', action = act.ScrollByPage(-0.75)},
    { key = 'PageDown', mods = 'NONE', action = act.ScrollByPage(0.75)},

}

config.keys = keys

return config
