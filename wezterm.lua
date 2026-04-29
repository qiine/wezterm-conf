-- __      __      _
-- \ \    / /__ __| |_ ___ _ _ _ __
--  \ \/\/ / -_)_ /  _/ -_) '_| '  \
--   \_/\_/\___/__|\__\___|_| |_|_|_|
--init-------------------------------

--safe requiring
-- local function safe_require(module)
--     local status, result = pcall(require, module)
--     if not status then
--         wezterm.log_error("Error loading module: '" .. module .. "'\n" .. result)
--         return nil
--     end
--     return result
-- end

--Pull wezterm API
local wez = require("wezterm")
local act = wez.action
local mux = wez.mux

--Config modules
local rendering = require("rendering")
local fonts     = require("fonts")

local windows = require("windows")
local tabs    = require("tabs")

local keymaps   = require("keymaps")
local mousemaps = require("mousemaps")

----------------------------------------------------

local config = wez.config_builder()

rendering.apply_to_config(config)
fonts.apply_to_config(config)

windows.apply_to_config(config)
tabs.apply_to_config(config)


-- Auto reload conf
config.automatically_reload_config = false

keymaps.apply_to_config(config)
mousemaps.apply_to_config(config)


config.term = "wezterm" -- needed to have undercurl
config.default_prog = { '/bin/bash' }


--Cursor
config.default_cursor_style = 'BlinkingBar'
config.cursor_blink_ease_in = 'EaseOut'
config.cursor_blink_ease_out = 'EaseOut'
config.cursor_blink_rate = 950


-- Capture multiple weztern instances
config.prefer_to_spawn_tabs = false

-- Return false to skip the confirmation for all processes
wez.on('mux-is-process-stateful', function(process)
    return false
end)

-- log
wez.log_info("hello wezterm! my name is " .. wez.hostname())


--Style
--config.color_scheme = 'Batmanfign'

return config

