
-- Keympas --

local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux
----------------------------------

local module = {}

--Disable key
--{
--    key = 'j',
--    mods = 'CTRL',
--    action = wezterm.action.Nop,
--}

function module.apply_to_config(config)

    config.disable_default_key_bindings = true
--      config.enable_kitty_keyboard = true

        --When set to true, each key event will be logged by the GUI layer as an INFO level log message on the stderr stream from wezterm. You will typically need to launch wezterm directly from another terminal to see this logging.
        --help figuring out how keys are being decoded on your system, or for discovering the system-dependent "raw" key code values.
        config.debug_key_events = true
    
    config.keys = {
        { key = "q", mods = "CTRL|SHIFT", action = act.QuitApplication },

        -- Reload config
        { key = "r", mods = "CTRL|SHIFT", action = act.ReloadConfiguration }, --TOdo add lecho restarted 

        -- Font size adjustments
        { key = "+", mods = "CTRL", action = act.IncreaseFontSize },
        { key = "-", mods = "CTRL", action = act.DecreaseFontSize },
        { key = "0", mods = "CTRL", action = act.ResetFontSize },

        -- Clipboard actions
        { key = "c", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
        --{key = 'c',
        --  mods = 'CTRL',
        --  action = wezterm.action_callback(function(window, pane)
        --    local sel = window:get_selection_text_for_pane(pane)
        --    if (not sel or sel == '') then
        --      window:perform_action(wezterm.action.SendKey{ key='c', mods='CTRL' }, pane)
        --    else
        --      window:perform_action(wezterm.action{ CopyTo = 'ClipboardAndPrimarySelection' }, pane)
        --    end
        --  end),
        --},
        --{ key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") },
        
        --Tabs
        { key = "w", mods = "CTRL|SHIFT", action = act.CloseCurrentTab({ confirm = false }) },
        { key = "t", mods = "CTRL|SHIFT", action = act.SpawnTab("CurrentPaneDomain") },
        { key = "Tab", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(1) }, --Cycle tabs

        --Panes
        -- { key = "N", mods = "SHIFT|CTRL", action = act.SpawnWindow },
        -- { key = "x", mods = "SHIFT", action = act.CloseCurrentPane({ confirm = false }) },
        -- { key = "f", mods = "SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
        -- { key = "d", mods = "SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
       
        --Pane navigation
        -- { key = "j", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
        -- { key = "k", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
        -- { key = "h", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
        -- { key = "l", mods = "CTRL", action = act.ActivatePaneDirection("Right") },

        -- Move focus between panes with arrow keys
        -- { key = "LeftArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Left") },
        -- { key = "RightArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Right") },
        -- { key = "UpArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Up") },
        -- { key = "DownArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Down") },
        
        { key = 'l', mods = 'CTRL|SHIFT', action = wezterm.action.ShowDebugOverlay},
        { key = "p", mods = "CTRL|SHIFT", action = wezterm.action.ShowLauncher },
        --{ key = "Tab", mods = "NONE", action = act.SendString("a")},

        --{ key = 'j',mods = 'CTRL', wezterm.action.Nop },

        {key = ",", mods = 'CTRL', action = act.SpawnCommandInNewTab{
                args = {
                    '/usr/bin/nvim',
                    os.getenv('WEZTERM_CONFIG_FILE'),
                },
            }
        },

    }--config keys
end

--   --smart copy/interuptn
--action = wezterm.action_callback(function(window, pane)
--    if pane:is_alt_screen_active() then
--     -- allow "full screen" TUI apps to receive and handle CTRL-C for themselves
--     window:perform_action(wezterm.action.SendKey{key='c', mods='CTRL'})
--    else
--     -- otherwise, treat it as a copy operation
--     window:perform_action(wezterm.action{ CopyTo = 'ClipboardAndPrimarySelection' })
--    end
--end)
--
return module

--smart copy/interupt
  --  { 
  --    key = 'c',
  --    mods = 'CTRL',
  --    action = wezterm.action_callback(function(window, pane)
  --      local sel = window:get_selection_text_for_pane(pane)
  --      if (not sel or sel == '') then
  --        window:perform_action(wezterm.action.SendKey{ key='c', mods='CTRL' }, pane)
  --      else
  --        window:perform_action(wezterm.action{ CopyTo = 'ClipboardAndPrimarySelection' }, pane)
  --      end
  --    end),
  --  },
  --  { key = 'v', mods = 'CTRL', action = wezterm.action.Paste },
  --  { key = 'v', mods = 'SHIFT|CTRL', action = wezterm.action_callback(function(window, pane)
  --    window:perform_action(wezterm.action.SendKey{ key='v', mods='CTRL' }, pane) end),
  --  },
  --  { key = 'V', mods = 'SHIFT|CTRL', action = wezterm.action_callback(function(window, pane)
  --    window:perform_action(wezterm.action.SendKey{ key='v', mods='CTRL' }, pane) end),
  --  },
  --  { key = 'c', mods = 'ALT', action = wezterm.action.Copy },
  --  { key = 'v', mods = 'ALT', action = wezterm.action.Paste },
  --
  --
  --},  -- smart copy/interuptn
--  --action = wezterm.action_callback(function(window, pane)
--   if pane:is_alt_screen_active() then
--     -- allow "full screen" TUI apps to receive and handle CTRL-C for themselves
--     window:perform_action(wezterm.action.SendKey{key='c', mods='CTRL'})
--   else
--     -- otherwise, treat it as a copy operation
--     window:perform_action(wezterm.action{ CopyTo = 'ClipboardAndPrimarySelection' })
--   end
--end)
