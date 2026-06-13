
-- mouse --

local wez = require("wezterm")
local act = wez.action
local mux = wez.mux
----------------------------------

local M = {}

local keys =
{
    { --wheel scroll up
       event = { Down = { streak = 1, button = { WheelUp = 1 } } },
       mods = "NONE",
       action = act.ScrollByCurrentEventWheelDelta,
       alt_screen = false,
    },
    { --wheel scroll down
       event = { Down = { streak = 1, button = { WheelDown = 1 } } },
       mods = "NONE",
       action = act.ScrollByCurrentEventWheelDelta,
       alt_screen = false,
    },

    {--Ctrl+wheel zoom +
        event = { Down = { streak = 1, button = { WheelUp = 1 } } },
        mods = 'CTRL',
        action = act.IncreaseFontSize,
    },
    {--Ctrl+wheel zoom -
        event = { Down = { streak = 1, button = { WheelDown = 1 } } },
        mods = 'CTRL',
        action = act.DecreaseFontSize,
    },

    {--no paste on middle click
        event = { Down = { streak = 1, button = "Middle" } },
        mods = 'NONE',
        action = act.Nop,
    },

    {--drag win
        event = { Drag = { streak = 1, button = 'Left' } },
        mods = 'SHIFT|ALT',
        action = act.StartWindowDrag,
    },

    -- Sel
    {
        event = { Down = { streak = 1, button = "Left" } },
        mods = "NONE",
        action = act.SelectTextAtMouseCursor("Cell"),
        alt_screen = false,
    },
    {
        event = { Drag = { streak = 1, button = "Left" } },
        mods = "NONE",
        action = act.ExtendSelectionToMouseCursor("Cell"),
        alt_screen = false,
    },
    {
        event = { Up = { streak = 1, button = "Left" } },
        mods = "NONE",
        action = act.CompleteSelection("ClipboardAndPrimarySelection"),
        alt_screen = false,
    },
}

function M.apply_to_config(config)
    config.disable_default_mouse_bindings = true

    config.bypass_mouse_reporting_modifiers = 'NONE'

    -- config.alternate_buffer_wheel_scroll_speed = 1
    -----------------------------------------------------------------

    config.mouse_bindings = keys
end


--------
return M
