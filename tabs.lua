
-- Tabs --

local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux
----------------------------------

local M = {}

function M.apply_to_config(config)

    config.enable_tab_bar = true
    config.hide_tab_bar_if_only_one_tab = true
    config.use_fancy_tab_bar = false

    config.tab_max_width = 20

    --set tabs name
    wezterm.on('format-tab-title', function(tab, hover)
        --Get tabs process name. (so nvim, bash...)
        --local process = string.gsub(tab.active_pane.foreground_process_name, '(.*[/\\])(.*)', '%2')
        local tab_name = tab.active_pane.foreground_process_name

        local atrr
        local tbg = "414141"
        local tfg

        if tab.is_active then
            atrr = { Intensity = "Bold" }
            --tbg = "414141"
        else
            atrr = { Intensity = "Normal" }
            --tbg = "black"
        end

        if hover then
            atrr = { Intensity = "Bold" }
            tbg = "white"
        end

        return
        {
            --{ Background = { Color = tbg } },
            --{ Foreground = { Color = foreground } },
            { Attribute = atrr },
            { Text = "[ "..tab_name.." ]" },
        }
    end)

end

return M
