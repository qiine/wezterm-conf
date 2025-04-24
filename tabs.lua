
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
        local tab_name = string.gsub(tab.active_pane.foreground_process_name, '(.*[/\\])(.*)', '%2')
        --local tab_name = tab.active_pane.foreground_process_name

        local atrr
        local tbg = "414141"
        local tfg
        local underline

        if tab.is_active then
            atrr = { Intensity = "Bold" }
            --tbg = "414141"
            underline = { Underline = "Single"}
        else
            atrr = { Intensity = "Normal" }
            --tbg = "black"
            underline = { Underline = "None"}
        end

        if hover then
            atrr = { Intensity = "Bold" }
            tbg = "white"
        end

        return
        {
            { Attribute = {Intensity = "Normal"} },
            { Attribute = {Italic = false} },
            {Text = "  "}, --⎸

            --{ Background = { Color = tbg } },
            --{ Foreground = { Color = foreground } },
            { Attribute = atrr },
            { Attribute = underline },
            { Attribute = {Italic = false} },
            { Text = tab_name },

            { Attribute = {Intensity = "Normal"} },
            { Attribute = {Underline="None"} },
            { Attribute = {Italic = false} },
            {Text = "  "}, --⎹
        }
    end)

end

return M
