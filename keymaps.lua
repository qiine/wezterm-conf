
-- Keymaps --

local wez = require("wezterm")
local act = require("wezterm").action
local mux = require("wezterm").mux
----------------------------------

local M = {}

function M.apply_to_config(config)
    config.disable_default_key_bindings = true
    --config.enable_kitty_keyboard = true

    --When set to true, each key event will be logged by the GUI layer as an INFO level log message on the stderr stream from wezterm. You will typically need to launch wezterm directly from another terminal to see this logging.
    --help figuring out how keys are being decoded on your system, or for discovering the system-dependent "raw" key code values.
    config.debug_key_events = false

    config.keys = {
        -- ALTGR+q
        { key = "@", mods = "CTRL", action = act.QuitApplication },
        -- Reload config -- ctrl + altgr + r
        { key = "¶", mods = "CTRL", action = act.ReloadConfiguration }, --TOdo add lecho restarted

        -- Font size adjustments
        { key = "+", mods = "CTRL", action = act.IncreaseFontSize },
        { key = "-", mods = "CTRL", action = act.DecreaseFontSize },
        -- { key = "0", mods = "CTRL", action = act.ResetFontSize },

        -- Clipboard actions
        {
            key = 'c',
            mods = 'CTRL',
            action = wez.action_callback(function(window, pane)
                if pane:is_alt_screen_active() then  -- Is in some TUI
                    window:perform_action(act.SendKey({key='c', mods='CTRL'}), pane)
                else
                    window:perform_action(act({CopyTo = 'ClipboardAndPrimarySelection'}), pane)
                end
            end),
        },
        {
            key = "v",
            mods = "CTRL",
            action = wez.action_callback(function(window, pane)
                if pane:is_alt_screen_active() then  -- Is in some TUI
                    window:perform_action(act.SendKey({ key = "v", mods = "CTRL" }), pane)
                else
                    window:perform_action(act.PasteFrom("Clipboard"), pane)
                end
            end),
        },


        --{key="Backspace", mods="CTRL", action=wezterm.action{SendString="\x1b[78~"} },

        -- to disambiguate from ^H
        { key="Backspace", mods="CTRL", action = act.SendKey{ key = "Backspace", mods ="SHIFT|ALT"} },

        {
            key = "PageUp",
            mods = "NONE",
            action = wez.action_callback(function(window, pane)
                if pane:is_alt_screen_active() then
                    window:perform_action(act.SendKey({ key = "PageUp", mods = "NONE" }), pane)
                else
                    window:perform_action(act.ScrollByPage(-1), pane)
                end
            end),
        },
        {
            key = "PageDown",
            mods = "NONE",
            action = wez.action_callback(function(window, pane)
                if pane:is_alt_screen_active() then
                    window:perform_action(act.SendKey({key = "PageDown", mods = "NONE"}), pane)
                else
                    window:perform_action(act.ScrollByPage(1), pane)
                end
            end),
        },

        -- ## Tabs
        {
            key = "w",
            mods = "CTRL",
            action = wez.action_callback(function(window, pane)
                if pane:is_alt_screen_active() then
                    window:perform_action(act.SendKey({key = "w", mods = "CTRL"}), pane)
                else
                    local mux_window = window:mux_window()
                    local tabs = mux_window:tabs()

                    if #tabs > 1 then
                        window:perform_action(act.CloseCurrentTab({confirm = false}), pane)
                    end
                end
            end),
        },
        { key = "ŧ", mods = "CTRL", action = act.SpawnTab("CurrentPaneDomain") },
        { key = "Tab", mods = "CTRL|ALT", action = act.ActivateTabRelative(1) }, --Cycle tabs

        -- ## Panes
        -- { key = "N", mods = "SHIFT|CTRL", action = act.SpawnWindow },

        { key = "„", mods = "CTRL|ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
        { key = "ħ", mods = "CTRL|ALT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
        { key = "ł", mods = "CTRL|ALT", action = act.CloseCurrentPane({ confirm = false }) },

        -- Pane navigation
        -- { key = "j", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
        -- { key = "k", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
        -- { key = "h", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
        -- { key = "l", mods = "CTRL", action = act.ActivatePaneDirection("Right") },

        -- Move focus between panes with arrow keys
        -- { key = "LeftArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Left") },
        -- { key = "RightArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Right") },
        -- { key = "UpArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Up") },
        -- { key = "DownArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Down") },

            -- Debug
        { key = '*', mods = 'CTRL|SHIFT', action = wez.action.ShowDebugOverlay},
        { key = "ù", mods = "CTRL|SHIFT", action = wez.action.ShowLauncher },

    }--config keys
end


--------
return M
