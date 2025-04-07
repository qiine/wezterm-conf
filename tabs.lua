
-- Tabs --

local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux
----------------------------------

local M = {}

function M.apply_to_config(config)

    config.enable_tab_bar = true
    config.hide_tab_bar_if_only_one_tab = true
    config.use_fancy_tab_bar = true

    config.tab_max_width = 20

    --Tab title
    --wezterm.on('format-tab-title', function(tab)
    --    local pane = tab.active_pane
    --    local title = pane:get_title() or ''
    --    local process = pane:get_foreground_process_name() or ''
    --    local app = process:match('[^/]+$') or 'shell'
    --
    --    -- Remove anything in parentheses, e.g. "main.py (/path)" -> "main.py"
    --    local cleaned = title:gsub('%s*%([^%)]+%)', '')
    --    cleaned = cleaned:match('[^/\\]+$') or cleaned -- remove any path if still present
    --
    --    if cleaned == '' or cleaned == app then
    --        cleaned = app
    --    end
    --
    --    return { { Text = ' ' .. "test" .. ' ' }, }
    --end)

end

return M
