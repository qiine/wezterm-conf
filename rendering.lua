
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

    config.max_fps = 100

end

return M
