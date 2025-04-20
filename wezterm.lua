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
local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

--Config modules
local rendering = require("rendering")
local fonts = require("fonts")

local windows = require("windows")
local tabs = require("tabs")

local keymaps = require("keymaps")
local mousemaps = require("mousemaps")

----------------------------------------------------

local config = wezterm.config_builder()

--Auto reload yeah
config.automatically_reload_config = false

rendering.apply_to_config(config)
fonts.apply_to_config(config)

windows.apply_to_config(config)
tabs.apply_to_config(config)

keymaps.apply_to_config(config)
mousemaps.apply_to_config(config)

--Cursor
config.default_cursor_style = 'BlinkingBar'
config.cursor_blink_ease_in = 'EaseOut'
config.cursor_blink_ease_out = 'EaseOut'
config.cursor_blink_rate = 950

--Capture multiple weztern instances
config.prefer_to_spawn_tabs = true

wezterm.on('mux-is-process-stateful', function(process)
  -- Return false to skip the confirmation for all processes
  return false
end)

--log
wezterm.log_info("hello wezterm! my name is " .. wezterm.hostname())


--Style
--config.color_scheme = 'Batmanfign'

return config

