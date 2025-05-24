
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
local fira = "Fira Code"  --fav
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
    --== g a @ &
    config.font = wezterm.font_with_fallback
    {
        {
            family = fira,
            style = "Normal",
            weight = "Medium", -- Medium, Regular, SemiBold, Bold
            stretch = "Normal",
            scale = 1.0,
            harfbuzz_features = {
                "calt=0", "clig=0", "liga=0", --no ligature
                "cv02", --g
                "ss05", --@
                "ss03", --&
                "cv14", --3
                "cv15", --*
            }
        },
        {
            family = noto,  -- deja
            style = "Normal",
            weight = "Medium",
            stretch = "Normal",
            scale = 1.2,
            harfbuzz_features = { "calt=0", "clig=0", "liga=0" } --set Ligature off
        }
    }


    config.font_size = 16
    config.line_height = 1.0    --non 1.0 buggy
    config.cell_width  = 1.0

    --config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" } --set Ligature off

    --Hinting and AA
    config.freetype_load_target = 'Normal' -- Normal Light Mono
    --config.underline_position = -2.5
    --config.underline_thickness = "1.5pt"

    --config.use_cap_height_to_scale_fallback_fonts = true

    --config.allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace"  --Always, Never, WhenFollowedBySpace
    config.warn_about_missing_glyphs = false

end

return M
