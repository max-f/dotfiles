" Vim color file
" Maintainer: Bert Muennich <be.muennich at googlemail.com>
" Last Change: 2012 Feb 05

" This color scheme uses a light background.

set background=light
highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "bored"

hi Normal guifg=black guibg=grey95
hi Comment guifg=grey45 gui=none ctermfg=darkblue cterm=none
hi Constant guifg=#AA2222 gui=none ctermfg=darkred cterm=none
hi Identifier guifg=#557777 gui=none ctermfg=darkcyan cterm=none
hi Statement guifg=#887700 gui=none ctermfg=darkyellow cterm=none
hi PreProc guifg=#992288 gui=none ctermfg=darkmagenta cterm=none
hi Type guifg=#118811 gui=none ctermfg=darkgreen cterm=none
hi Special guifg=#115599 gui=none ctermfg=darkblue cterm=none
hi MatchParen guifg=black guibg=#557777 gui=none ctermfg=black ctermbg=darkcyan cterm=none
hi Error guifg=white guibg=#AA2222 gui=none ctermfg=white ctermbg=darkred cterm=none
hi Todo guifg=white guibg=#992288 gui=none ctermfg=white ctermbg=darkmagenta cterm=none
hi Directory guifg=#115599 ctermfg=darkblue
hi LineNr guifg=grey60 gui=none ctermfg=darkyellow cterm=none
hi StatusLine guifg=white guibg=#115599 gui=bold ctermfg=white ctermbg=darkblue cterm=bold
hi StatusLineNC guifg=grey70 guibg=black gui=none ctermfg=none ctermbg=none cterm=reverse
hi VertSplit guifg=grey70 guibg=black gui=none ctermfg=none ctermbg=none cterm=reverse
hi Search guifg=white guibg=#887700 ctermfg=white ctermbg=darkyellow
hi Visual guifg=black guibg=grey65 gui=none ctermbg=none cterm=reverse
hi Pmenu guifg=black guibg=grey70 gui=none ctermfg=white ctermbg=darkblue cterm=none
hi PmenuSel guifg=white guibg=#115599 gui=none ctermfg=black ctermbg=darkyellow
hi PmenuSbar guibg=grey50 ctermbg=white
hi PmenuThumb guifg=grey20 ctermfg=black
hi ModeMsg guifg=black gui=none ctermfg=blue cterm=bold
hi ErrorMsg guifg=white guibg=#AA2222 gui=none ctermfg=white ctermbg=darkred cterm=none
hi WarningMsg guifg=#AA2222 gui=none ctermfg=darkred cterm=none
hi Question guifg=#118811 ctermfg=darkgreen
hi TabLine guifg=grey70 guibg=grey40 gui=none cterm=underline
hi TabLineFill guifg=black guibg=black gui=none cterm=reverse
hi TabLineSel guifg=black guibg=grey90 gui=bold cterm=bold
hi FoldColumn guifg=#115599 guibg=grey80 gui=none ctermfg=darkyellow ctermbg=none cterm=none
hi Folded guifg=#115599 guibg=grey80 gui=none ctermfg=darkyellow ctermbg=none cterm=none
hi DiffAdd guifg=black guibg=#99CCCC gui=none ctermfg=black ctermbg=darkcyan cterm=none
hi DiffChange guifg=black guibg=#CCCC77 gui=none ctermfg=black ctermbg=darkyellow cterm=none
hi DiffDelete guifg=black guibg=#CC8888 gui=none ctermfg=black ctermbg=darkred cterm=none
hi DiffText guifg=white guibg=#AA55AA gui=none ctermfg=white ctermbg=darkmagenta cterm=none
