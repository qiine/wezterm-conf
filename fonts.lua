
-- fonts --

local wezterm = require("wezterm")
----------------------------------

local M = {}

--troubleshoot: wezterm ls-fonts
--To Get actual family name
--fc-scan /usr/local/share/fonts | grep family

--Nerd font source: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts
local jet = "JetBrains Mono"
local hack = "Hack Nerd Font Mono"
local iconsol = "Inconsolata Nerd Font Mono"
local droid = "DroidSansM Nerd Font Mono"
local deja = "DejaVuSansM Nerd Font Mono"
local robot = "RobotoMono Nerd Font Mono"
local noto = "NotoSansM Nerd Font"
local meslo = "MesloLGM Nerd Font Mono"
local fira = "Fira Code"
local vic = "VictorMono Nerd Font Mono"
local sauce = "SauceCodePro Nerd Font"

function M.apply_to_config(config)

    --Tells wezterm to look first for fonts in the directory named `fonts`
    --Located alongside your `wezterm.lua` file.
    --Can list mutliple paths
    config.font_dirs =
    {
        "/usr/local/share/fonts",
        os.getenv("HOME") .. "/.local/share/fonts",
        "fonts",
    }
    --config.font_locator = "ConfigDirsOnly"

    --🤔
    config.font = wezterm.font(
    {
        family = fira,
        style = "Normal",
        weight = "Medium", -- Medium Regular
        stretch = "Normal",
    })

    config.font_size = 16
    config.line_height = 1.0    --non 1.0 buggy
    config.cell_width  = 1.0
    config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" } --set Ligature off

    --Hinting and AA
    config.freetype_load_target = 'Normal' -- Normal Light Mono
    --config.underline_position = -2.5
    --config.underline_thickness = "1.5pt"

    config.warn_about_missing_glyphs = false


end

return M
