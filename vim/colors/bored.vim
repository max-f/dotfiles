" Vim color file
" Maintainer: Bert Muennich <ber.t at posteo.de>
" Last Change: 2014 Mar 10

" This color scheme uses a dark background.

set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif	
let g:colors_name = "bored"

hi clear Directory
hi clear FoldColumn
hi clear Folded
hi clear LineNr
hi clear MatchParen

hi Normal guifg=#EEEEEE guibg=#111111 gui=none
hi NonText guifg=#5D90C9 guibg=bg gui=bold ctermfg=blue ctermbg=none cterm=bold
hi SpecialKey guifg=#5D90C9 guibg=bg gui=bold ctermfg=blue ctermbg=none cterm=bold
hi IncSearch guifg=black guibg=#D2B459 ctermfg=black ctermbg=darkyellow cterm=none
hi Search guifg=black guibg=#D2B459 ctermfg=black ctermbg=darkyellow cterm=none
hi Visual guifg=black guibg=#999999 gui=none ctermfg=none ctermbg=none cterm=reverse
hi Title guifg=fg guibg=bg gui=bold ctermfg=none ctermbg=none cterm=bold
hi ColorColumn guifg=fg guibg=#555555 ctermfg=black ctermbg=gray

hi StatusLine guifg=white guibg=#5D90C9 gui=bold ctermfg=white ctermbg=darkblue cterm=bold
hi StatusLineNC guifg=#111111 guibg=#CCCCCC gui=none ctermfg=none ctermbg=none cterm=reverse
hi VertSplit guifg=#111111 guibg=#CCCCCC gui=none ctermfg=none ctermbg=none cterm=reverse

hi Pmenu guifg=#EEEEEE guibg=#555555 gui=none ctermfg=none ctermbg=none cterm=reverse
hi PmenuSel guifg=white guibg=#5D90C9 gui=bold ctermfg=white ctermbg=darkblue cterm=bold
hi PmenuSbar guifg=#333333 guibg=#333333 ctermfg=black ctermbg=black
hi PmenuThumb guifg=#999999 guibg=#999999 ctermfg=white ctermbg=white

hi ModeMsg guifg=fg guibg=bg gui=bold ctermfg=none ctermbg=none cterm=bold
hi MoreMsg guifg=fg guibg=bg gui=bold ctermfg=none ctermbg=none cterm=bold
hi ErrorMsg guifg=fg guibg=bg gui=reverse ctermfg=none ctermbg=none cterm=reverse
hi WarningMsg guifg=fg guibg=bg gui=reverse ctermfg=none ctermbg=none cterm=reverse
hi Question guifg=fg guibg=bg gui=bold ctermfg=none ctermbg=none cterm=bold

hi TabLine guifg=#444444 guibg=#DDDDDD gui=none ctermfg=none ctermbg=none cterm=reverse
hi TabLineFill guifg=#444444 guibg=#DDDDDD gui=none ctermfg=none ctermbg=none cterm=reverse
hi TabLineSel guifg=fg guibg=bg gui=bold ctermfg=none ctermbg=none cterm=bold

hi DiffAdd guifg=#EEEEEE guibg=#116666 gui=none ctermfg=black ctermbg=darkcyan cterm=none
hi DiffChange guifg=#EEEEEE guibg=#666611 gui=none ctermfg=black ctermbg=darkyellow cterm=none
hi DiffDelete guifg=#EEEEEE guibg=#662222 gui=none ctermfg=black ctermbg=darkred cterm=none
hi DiffText guifg=#111111 guibg=#A672BF gui=none ctermfg=black ctermbg=darkmagenta cterm=none

