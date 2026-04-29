
-- Rendering --

local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux
----------------------------------

local M = {}

function M.apply_to_config(config)

    config.front_end = "OpenGL" -- OpenGL, WebGpu, Software
    config.prefer_egl = true


    config.animation_fps = 100
    config.max_fps = 120

    -- config.show_fps = true

    config.inactive_pane_hsb = {
        saturation = 1.0,
        brightness = 1.0,
    }
end

return M
