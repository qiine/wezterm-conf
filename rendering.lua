
-- Rendering --

local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux
----------------------------------

local M = {}

function M.apply_to_config(config)

    config.front_end = "OpenGL" -- OpenGL, WebGpu, Software
    config.prefer_egl = true

    config.animation_fps = 120

end

return M
