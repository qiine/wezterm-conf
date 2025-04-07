
-- mouse --

local wezterm = require("wezterm")
local wact = wezterm.action
local mux = wezterm.mux
----------------------------------

local module = {}

local keys =
{
    --{--wheel scroll up
    --    event = { Down = { streak = 1, button = { WheelUp = 1 } } },
    --    mods = "NONE",
    --    action = wact.ScrollByCurrentEventWheelDelta,
    --    --action = wact.ScrollByLine(-1),
    --    --action = wact.Nop,
    --    enable_mouse_reporting = false,
    --},
    --{--wheel scroll down
    --    event = { Down = { streak = 1, button = { WheelDown = 1 } } },
    --    mods = "NONE",
    --    action = wact.ScrollByCurrentEventWheelDelta,
    --    --action = wact.ScrollByLine(1),
    --    --action = wact.Nop,
    --    enable_mouse_reporting = false,
    --},

    {--Ctrl+wheel zoom +
        event = { Down = { streak = 1, button = { WheelUp = 1 } } },
        mods = 'CTRL',
        action = wact.IncreaseFontSize,
        --action = wact.Nop,
        --enable_mouse_reporting = true,
        enable_mouse_reporting = false,
    },
    {--Ctrl+wheel zoom -
        event = { Down = { streak = 1, button = { WheelDown = 1 } } },
        mods = 'CTRL',
        action = wact.DecreaseFontSize,
        --action = wact.Nop,
        --enable_mouse_reporting = true,
        enable_mouse_reporting = false,
    },

    {--no paste on middle click
        event = { Down = { streak = 1, button = "Middle" } },
        mods = 'NONE',
        action = wact.Nop,
    },

    {--drag win
        event = { Drag = { streak = 1, button = 'Left' } },
        mods = 'SHIFT|ALT',
        action = wact.StartWindowDrag,
    },

    --{event = {Drag = {streak = 1, button = 'Left'}}, mods = "ALT", action = wact.ExtendSelectionToMouseCursor("Block") },
}
--
--local keys_nvim = 
--{
--    {--Ctrl+wheel zoom
--        event = { Down = { streak = 1, button = { WheelUp = 1 } } },
--        mods = 'CTRL',
--        --action = wact.IncreaseFontSize,
--        action = wact.Nop,
--        enable_mouse_reporting = true,
--        --enable_mouse_reporting = false,
--    },
--    {
--        event = { Down = { streak = 1, button = { WheelDown = 1 } } },
--        mods = 'CTRL',
--        --action = wact.DecreaseFontSize,
--        waction = wact.Nop,
--        enable_mouse_reporting = true,
--        --enable_mouse_reporting = false,
--    },
--}

--local function is_nvim(window)
--    local pane = window:get_active_pane()
--    local process_name = pane:get_foreground_process_name()
--    return process_name and process_name:match("nvim")
--end
--
--wezterm.on("format-window-title", function(window, pane)
--    if is_nvim(window) then
--        wezterm.log_info("Detected Neovim, switching keybindings")
--        window:set_config_overrides({ mouse_bindings = keys_nvim })
--    else
--        wezterm.log_info("Using normal keybindings")
--        window:set_config_overrides({ mouse_bindings = keys })
--    end
--end)

function module.apply_to_config(config)
    
    --config.bypass_mouse_reporting_modifiers = 'ALT'
    config.bypass_mouse_reporting_modifiers = 'NONE'
    config.disable_default_mouse_bindings = true
    -----------------------------------------------------------------
    
    config.mouse_bindings = keys
    

    --config.mouse_bindings = {}


end

return module

--local wezterm = require 'wezterm'
--
--wezterm.on('toggle-opacity', function(window, pane)
--  local overrides = window:get_config_overrides() or {}
--  if not overrides.window_background_opacity then
--    overrides.window_background_opacity = 0.5
--  else
--    overrides.window_background_opacity = nil
--  end
--  window:set_config_overrides(overrides)
--end)
--
--return {
--  keys = {
--    {
--      key = 'B',
--      mods = 'CTRL|SHIFT',
--      action = wezterm.action.EmitEvent 'toggle-opacity',
--    },
--  },
--}
--
--
--
--wezterm.on('update-keybindings', function(window, pane)
--  local overrides = window:get_config_overrides() or {}
--  local title = pane:get_foreground_process_name() -- Get the active process
--
--  if title:match('nvim') then
--    overrides.keys = {
--      { key = 'Escape', mods = 'CTRL', action = wezterm.action.SendKey { key = 'q', mods = 'CTRL' } },
--    }
--  else
--    overrides.keys = nil -- Reset to default
--  end
--
--  window:set_config_overrides(overrides)
--end)
--
--return {
--  keys = {
--    { key = 'F12', action = wezterm.action.EmitEvent 'update-keybindings' },
--  },
--}
--
