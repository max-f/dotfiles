-- Solarized JetBrains Theme for Neovim
-- Based on the Solarized palette with JetBrains-style restrained highlighting
-- Place this file in: ~/.config/nvim/colors/solarized_jetbrains.lua

local M = {}

-- Solarized color palette
local colors = {
	-- Base colors (dark variant)
	base03  = '#002b36', -- darkest background
	base02  = '#073642', -- background highlights
	base01  = '#586e75', -- comments, secondary content
	base00  = '#657b83', -- dark gray
	base0   = '#839496', -- body text (gray-ish normal text)
	base1   = '#93a1a1', -- optional emphasized content
	base2   = '#eee8d5', -- background highlights (light)
	base3   = '#fdf6e3', -- lightest background

	-- Accent colors (used sparingly)
	yellow  = '#b58900',
	orange  = '#cb4b16',
	red     = '#dc322f',
	magenta = '#d33682',
	violet  = '#6c71c4',
	blue    = '#268bd2',
	cyan    = '#2aa198',
	green   = '#859900',
}

function M.setup(variant)
	variant = variant or 'dark'

	-- Clear existing highlights
	vim.cmd('hi clear')
	if vim.fn.exists('syntax_on') then
		vim.cmd('syntax reset')
	end

	vim.o.termguicolors = true
	vim.g.colors_name = 'solarized_jetbrains'

	local bg, bg_alt, fg, fg_alt, comment

	if variant == 'dark' then
		bg = colors.base03
		bg_alt = colors.base02
		fg = colors.base0 -- Gray-ish normal text
		fg_alt = colors.base1
		comment = colors.base01
	else
		bg = colors.base3
		bg_alt = colors.base2
		fg = colors.base00 -- Gray-ish normal text for light theme
		fg_alt = colors.base01
		comment = colors.base1
	end

	-- Define highlight groups with restrained colors
	local highlights = {
		-- Editor highlights
		Normal                     = { fg = fg, bg = bg },
		NormalFloat                = { fg = fg, bg = bg_alt },
		Comment                    = { fg = comment, italic = true },
		Constant                   = { fg = colors.cyan }, -- Subtle cyan for constants
		String                     = { fg = colors.cyan }, -- Consistent with constants
		Character                  = { fg = colors.cyan },
		Number                     = { fg = colors.magenta }, -- Subtle magenta for numbers
		Boolean                    = { fg = colors.magenta },
		Float                      = { fg = colors.magenta },

		Identifier                 = { fg = fg }, -- Keep identifiers in normal text color
		Function                   = { fg = colors.blue }, -- Subtle blue for functions

		Statement                  = { fg = colors.green }, -- Green for keywords
		Conditional                = { fg = colors.green },
		Repeat                     = { fg = colors.green },
		Label                      = { fg = colors.green },
		Operator                   = { fg = fg }, -- Operators in normal text color
		Keyword                    = { fg = colors.green },
		Exception                  = { fg = colors.orange },

		PreProc                    = { fg = colors.orange }, -- Orange for preprocessor
		Include                    = { fg = colors.blue },
		Define                     = { fg = colors.orange },
		Macro                      = { fg = colors.orange },
		PreCondit                  = { fg = colors.orange },

		Type                       = { fg = colors.yellow }, -- Yellow for types
		StorageClass               = { fg = colors.yellow },
		Structure                  = { fg = colors.yellow },
		Typedef                    = { fg = colors.yellow },

		Special                    = { fg = colors.orange },
		SpecialChar                = { fg = colors.orange },
		Tag                        = { fg = colors.blue },
		Delimiter                  = { fg = fg }, -- Keep delimiters subtle
		SpecialComment             = { fg = comment },
		Debug                      = { fg = colors.red },

		Underlined                 = { fg = colors.violet, underline = true },
		Ignore                     = { fg = bg },
		Error                      = { fg = colors.red, bg = bg },
		Todo                       = { fg = colors.magenta, bold = true },

		-- UI Elements
		LineNr                     = { fg = comment },
		CursorLineNr               = { fg = fg_alt },
		CursorLine                 = { bg = bg_alt },
		CursorColumn               = { bg = bg_alt },
		ColorColumn                = { bg = bg_alt },
		SignColumn                 = { fg = comment, bg = bg },
		Folded                     = { fg = comment, bg = bg_alt },
		FoldColumn                 = { fg = comment, bg = bg },

		VertSplit                  = { fg = bg_alt },
		WinSeparator               = { fg = bg_alt },
		StatusLine                 = { fg = fg, bg = bg_alt },
		StatusLineNC               = { fg = comment, bg = bg_alt },

		Pmenu                      = { fg = fg, bg = bg_alt },
		PmenuSel                   = { fg = bg, bg = colors.blue },
		PmenuSbar                  = { bg = bg_alt },
		PmenuThumb                 = { bg = comment },

		TabLine                    = { fg = comment, bg = bg_alt },
		TabLineFill                = { bg = bg_alt },
		TabLineSel                 = { fg = fg, bg = bg },

		Search                     = { fg = bg, bg = colors.yellow },
		IncSearch                  = { fg = bg, bg = colors.orange },
		Substitute                 = { fg = bg, bg = colors.orange },

		Visual                     = { bg = bg_alt },
		VisualNOS                  = { bg = bg_alt },

		ModeMsg                    = { fg = colors.green },
		MoreMsg                    = { fg = colors.green },
		Question                   = { fg = colors.cyan },
		WarningMsg                 = { fg = colors.orange },
		ErrorMsg                   = { fg = colors.red },

		MatchParen                 = { fg = colors.red, bg = bg_alt, bold = true },

		Directory                  = { fg = colors.blue },
		Title                      = { fg = colors.orange, bold = true },

		-- Diff
		DiffAdd                    = { fg = colors.green, bg = bg_alt },
		DiffChange                 = { fg = colors.yellow, bg = bg_alt },
		DiffDelete                 = { fg = colors.red, bg = bg_alt },
		DiffText                   = { fg = colors.blue, bg = bg_alt, bold = true },

		-- Spell
		SpellBad                   = { undercurl = true, sp = colors.red },
		SpellCap                   = { undercurl = true, sp = colors.violet },
		SpellLocal                 = { undercurl = true, sp = colors.yellow },
		SpellRare                  = { undercurl = true, sp = colors.cyan },

		-- Diagnostic
		DiagnosticError            = { fg = colors.red },
		DiagnosticWarn             = { fg = colors.yellow },
		DiagnosticInfo             = { fg = colors.blue },
		DiagnosticHint             = { fg = colors.cyan },

		-- LSP
		LspReferenceText           = { bg = bg_alt },
		LspReferenceRead           = { bg = bg_alt },
		LspReferenceWrite          = { bg = bg_alt, underline = true },

		-- TreeSitter (more restrained highlighting)
		['@variable']              = { fg = fg }, -- Variables in normal text
		['@variable.builtin']      = { fg = colors.orange },
		['@variable.parameter']    = { fg = fg },
		['@variable.member']       = { fg = fg },

		['@constant']              = { fg = colors.cyan },
		['@constant.builtin']      = { fg = colors.cyan },
		['@constant.macro']        = { fg = colors.orange },

		['@module']                = { fg = fg },
		['@label']                 = { fg = colors.green },

		['@string']                = { fg = colors.cyan },
		['@string.regex']          = { fg = colors.orange },
		['@string.escape']         = { fg = colors.orange },
		['@character']             = { fg = colors.cyan },
		['@character.special']     = { fg = colors.orange },
		['@boolean']               = { fg = colors.magenta },
		['@number']                = { fg = colors.magenta },
		['@float']                 = { fg = colors.magenta },

		['@function']              = { fg = colors.blue },
		['@function.builtin']      = { fg = colors.blue },
		['@function.call']         = { fg = colors.blue },
		['@function.macro']        = { fg = colors.orange },
		['@method']                = { fg = colors.blue },
		['@method.call']           = { fg = colors.blue },
		['@constructor']           = { fg = colors.yellow },
		['@parameter']             = { fg = fg },

		['@keyword']               = { fg = colors.green },
		['@keyword.function']      = { fg = colors.green },
		['@keyword.operator']      = { fg = colors.green },
		['@keyword.return']        = { fg = colors.green },
		['@conditional']           = { fg = colors.green },
		['@repeat']                = { fg = colors.green },
		['@exception']             = { fg = colors.orange },

		['@type']                  = { fg = colors.yellow },
		['@type.builtin']          = { fg = colors.yellow },
		['@type.qualifier']        = { fg = colors.green },
		['@type.definition']       = { fg = colors.yellow },

		['@storageclass']          = { fg = colors.yellow },
		['@attribute']             = { fg = colors.orange },
		['@field']                 = { fg = fg },
		['@property']              = { fg = fg },

		['@include']               = { fg = colors.blue },
		['@preproc']               = { fg = colors.orange },
		['@define']                = { fg = colors.orange },
		['@macro']                 = { fg = colors.orange },

		['@operator']              = { fg = fg }, -- Keep operators subtle

		['@punctuation.delimiter'] = { fg = fg },
		['@punctuation.bracket']   = { fg = fg },
		['@punctuation.special']   = { fg = colors.orange },

		['@comment']               = { fg = comment, italic = true },
		['@tag']                   = { fg = colors.blue },
		['@tag.attribute']         = { fg = colors.yellow },
		['@tag.delimiter']         = { fg = fg },

		['@text']                  = { fg = fg },
		['@text.strong']           = { bold = true },
		['@text.emphasis']         = { italic = true },
		['@text.underline']        = { underline = true },
		['@text.strike']           = { strikethrough = true },
		['@text.title']            = { fg = colors.orange, bold = true },
		['@text.uri']              = { fg = colors.blue, underline = true },
		['@text.todo']             = { fg = colors.magenta, bold = true },
		['@text.note']             = { fg = colors.cyan },
		['@text.warning']          = { fg = colors.yellow },
		['@text.danger']           = { fg = colors.red },
	}

	-- Apply highlights
	for group, settings in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, settings)
	end
end

-- Setup dark variant by default
M.setup('dark')

-- Commands to switch variants
vim.api.nvim_create_user_command('SolarizedDark', function()
  M.setup('dark')
end, {})

vim.api.nvim_create_user_command('SolarizedLight', function()
  M.setup('light')
end, {})

return M

