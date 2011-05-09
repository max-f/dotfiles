"-----------------------------------
" file:             .vimrc
" author:           keks
" last modified:    May 2011
"-----------------------------------

" vim > vi settings
set nocompatible

" intending
set autoindent
set smartindent

" encoding
set fileencoding=utf-8
set tenc=utf-8

filetype on
filetype indent on
filetype plugin on

set nu              " show line numbers
set relativenumber  " relative to current line

" no backup
set noswapfile

" text layout
set tabstop=4       " tabs have 4 spaces
set backspace=2     " backspace 2 spaces
set shiftwidth=4    " intending 4 spaces
set expandtab       " for discussion
set textwidth=80    " readable line length
set list            " show these 'invisible' chars
set listchars=tab:»­,trail:·,eol:¶,nbsp:⎵,precedes:←,extends:→ sbr=↪

" searching
set incsearch hlsearch
set ignorecase

" {{{ Folding test
if has("folding")
    set foldenable
    set foldmethod=marker
    set foldmarker={{{,}}}
    set foldcolumn=0
    set foldlevel=100
endif
"}}}

" status bar info and appearance
set statusline=\ \%f%m%r%h%w\ ::\ %y\ [%{&ff}]\%=\ [%04v]\ [%p%%:\ %l/%L]\ 
set laststatus=2
set cmdheight=1
let g:loaded_matchparen=1

" gui options
set guioptions-=m
set guioptions-=T
set guifont=montecarlo

" space bar un-highligts search
:noremap <silent> <Space> :silent noh<Bar>echo<CR>

" Allows writing to files with root privileges
cmap w!! %!sudo tee > /dev/null %  

" Printer
set printdevice=HP_LaserJet_1022

" au foo
" python stuff
au Filetype python setlocal tabstop=4
au Filetype python setlocal shiftwidth=4
au Filetype python setlocal smarttab
au Filetype python setlocal expandtab
au Filetype python setlocal softtabstop=4
au Filetype python setlocal autoindent
au Filetype python setlocal tw=80
au Filetype python let g:pydiction_location  = '~/.vim/ftplugin/pydiction/complete-dict'
au Filetype python highlight BadWhitespace ctermbg=red guibg=red
au Filetype python match BadWhitespace /^\t\+/
au Filetype python match BadWhitespace /\s\+$/
"au FileType python setlocal sw=4 sts=4 et tw=79

" ctag plugin required:
let g:ctags_statusline=1 

" C stuff
au Filetype c setlocal expandtab
au Filetype c setlocal shiftwidth=4
au Filetype c setlocal showmatch
au Filetype c setlocal tw=79

" tex stuff(vim-latexsuite)
au Filetype tex let g:tex_flavor = "latex"
set grepprg=grep\ -nH\ $*
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
au Filetype tex setlocal shiftwidth=2
au Filetype tex setlocal tabstop=2
au Filetype tex setlocal expandtab
au Filetype tex setlocal iskeyword+=:

" web stuff
au Filetype html,css setlocal tabstop=2
au Filetype html,css setlocal shiftwidth=2
au Filetype html,css setlocal softtabstop=2 " (sts) makes spaces feel like tabs (like deleting)

"keymappings
"paste
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>
"delete cursor mappings
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap <Up> <NOP>


let mapleader                    = ','
"nerdtree
map <F3> <Esc>:NERDTreeToggle<CR> 

" look
syntax on
set colorcolumn=81

" optional
if has('gui_win32')
        set guifont=Inconsolata:h12:cANSI
 endif

if $TERM == 'linux'
    let &t_Co = 8
    color peachpuff
    set nolist
    set colorcolumn+=81
    hi ColorColumn term=none cterm=none ctermbg=3
    hi CursorLine term=none cterm=none ctermbg=none
else
    color neverland
endif

set cul
hi Cursorline term=none cterm=none ctermbg=17

" necessary for indent_guides
set background=dark
