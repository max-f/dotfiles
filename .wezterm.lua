-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

config.color_scheme = 'zenwritten_dark'
--[[ config.color_scheme = 'Selenized Light (Gogh)' ]]
config.font = wezterm.font_with_fallback({
--[[ 	{family='Iosevka', weight='Medium'}, ]]
	{family='Maple Mono NF', weight='Medium'},
--[[ 	{family='CaskaydiaCove Nerd Font', weight='Regular'},  ]]
--[[ 	{family='JetBrainsMono', weight='Medium'}, ]]
--[[     {family='Noto Color Emoji', scale = 1 }, ]]
	{family='Symbols Nerd Font Mono', scale = 1}
})
-- 'Noto Color Emoji'
--
-- important for some neovim themes:
-- config.force_reverse_video_cursor = true

config.font_size = 12.0
config.hide_tab_bar_if_only_one_tab = true

-- default is true, has more "native" look
config.use_fancy_tab_bar = false

-- I don't like putting anything at the ege if I can help it.
config.enable_scroll_bar = false
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.tab_bar_at_bottom = true
config.warn_about_missing_glyphs = false

-- and finally, return the configuration to wezterm
config.keys = {
  {key="Enter", mods="SHIFT", action=wezterm.action{SendString="\x1b\r"}},
}

return config
