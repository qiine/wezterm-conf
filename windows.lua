

-- Win --

local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux
--------------------------------------

local M = {}

function M.apply_to_config(config)

    config.window_decorations = "NONE" -- RESIZE, NONE, INTEGRATED_BUTTONS 
    config.window_background_opacity = 0.85
    
    config.adjust_window_size_when_changing_font_size = false
    config.use_resize_increments = false -- true is buggy

    config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
    config.initial_rows = 100
    config.initial_cols = 100

    --Start maximized
--      wezterm.on("gui-startup", function()
--          local tab, pane, window = mux.spawn_window(cmd or {})
--          window:gui_window():maximize()
--      end)

    config.window_close_confirmation = 'NeverPrompt'

    config.max_fps = 120
    
    config.scrollback_lines = 5000
end

return M

