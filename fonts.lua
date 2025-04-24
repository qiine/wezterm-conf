
-- fonts --

local wezterm = require("wezterm")
----------------------------------

local M = {}

--troubleshoot: wezterm ls-fonts
--To Get actual family name
--fc-scan /usr/local/share/fonts | grep family
--fc-scan ~/.local/share/fonts | grep family

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
local mona = "Monaspace Argon Var"
local com = "CommitMonoCustom"

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
    --⛬ ⫶ ∴ ⋮ ▪ ∷ ⁘ ᠅ ⸭ ⁖ ᐧ 𝋣
    -- ⏺ 🞄 ᭼ 𝀝 𝀛
    --==
    config.font = wezterm.font_with_fallback
    {
        {
            family = com,
            style = "Normal",
            weight = "Regular", -- Medium, Regular, SemiBold, Bold
            stretch = "Normal",
            scale = 1.0,
            harfbuzz_features = {
                "calt=0", "clig=0", "liga=0", --no ligature
                "cv30",  --vertically higher *asterisk, 6 points
                "cv01=2", --0
            }
        },
        {
            family = deja,  -- deja
            style = "Normal",
            weight = "Regular",
            stretch = "Normal",
            scale = 1.5,
            harfbuzz_features = { "calt=0", "clig=0", "liga=0" } --set Ligature off
        }
    }

--{"weight":600,"italic":false,"alternates":{"cv01":false,"cv02":true,"cv03":false,"cv04":false,"cv05":true,"cv06":true,"cv07":false,"cv08":false,"cv09":true,"cv10":false,"cv11":false},"features":{"ss01":false,"ss02":false,"ss03":false,"ss04":false,"ss05":true},"letterSpacing":0,"lineHeight":1,"fontName":"Custom"}

    config.font_size = 16
    config.line_height = 1.1    --non 1.0 buggy
    config.cell_width  = 1.0

    --config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" } --set Ligature off

    --Hinting and AA
    --config.freetype_load_target = 'Normal' -- Normal Light Mono
    --config.underline_position = -2.5
    --config.underline_thickness = "1.5pt"

    --config.use_cap_height_to_scale_fallback_fonts = true

    --config.allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace"  --Always, Never, WhenFollowedBySpace
    config.warn_about_missing_glyphs = false

end

return M
