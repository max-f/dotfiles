"----------------------------------------------------
"
" File:         ~/.config/nvim/init.vim
"
"----------------------------------------------------

" vim > vi settings
set nocompatible

" Include my custom functions
source ~/.vim/functions.vim

" encoding
set enc=utf-8

" intending as necessary
filetype plugin indent on

set relativenumber  "show numbers  relative to current line

" The PC is fast enough, do syntax highlight syncing from start
autocmd BufEnter * :syntax sync fromstart

" mourse
set mouse=a

" no backup
set noswapfile
"set backupdir=/tmp

" unlimited undo
set undofile
set undodir=~/.vim/undodir

" text layout
set cursorline      " highlight cursor line
"set colorcolumn=+1,+2
set showmatch       " jump briefly to matching brace
set showmode        " show current mode
set tabstop=4       " tabs have 4 spaces
set backspace=indent,eol,start     " backspace is able to erase newlines & stuff
set shiftwidth=4    " intending 4 spaces
set expandtab       " for discussion
set textwidth=79    " readable line length
set list            " show these 'invisible' chars
set listchars=tab:>-,trail:·
set wrap

" window layout
set winfixwidth
set winfixheight
set winwidth=80
set winminwidth=40
" NerdTree specific
let g:NERDTreeWinSize = 40

" searching
set incsearch hlsearch
set ignorecase

" {{{ Folding test
if has("folding")
    set foldenable
    set foldmethod=marker
    set foldmarker={{{,}}}
    set foldcolumn=2
    "set foldlevel=100
endif
"}}}

" matching
set matchtime=2
set matchpairs+==:;
set matchpairs+=<:>

" status bar info and appearance - rest done by statusbar.vim
set cmdheight=2
set laststatus=2
set showcmd

" gui options
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=l

if has("gui_win32")
    set guifont=Inconsolata:h12:cANSI
else
    set guifont=Iosevka
endif

" Printer
set printdevice=HP_LaserJet_1022

" {{{ keymappings

"paste
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>
set clipboard+=unnamedplus

"Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Remap arrows to split navigation
nnoremap <Right> <C-w>l
nnoremap <Left> <C-w>h
nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j

" space bar un-highligts search
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

"'\' is a bit far away for <leader>
let mapleader = ','

"nerdtree
map <F3> <Esc>:NERDTreeToggle<CR>

"tagbar
map <F4> <Esc>:TagbarToggle<CR>

" copy or paste from X11 clipboard
" http://vim.wikia.com/wiki/GNU/Linux_clipboard_copy/paste_with_xclip
" requires: xclip
" usage: visual mode select then hit F5 to copy
" hit F6 to paste from GUI to vim without formating issues
vmap <F5> :!xclip -f -sel clip<CR>
map <F6> mz:-1r !xclip -o -sel clip<CR>`z

"Gundo
nnoremap <F7> :GundoToggle<CR>

" fzf-preview
nmap <unique> <leader>pe :FzfPreviewProjectFiles<CR>
nmap <unique> <leader>pg :FzfPreviewProjectGrep<CR>
nmap <unique> <leader>pf :FzfPreviewDirectoryFiles<CR>

" }}}

" {{{ Specify plugins

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sjl/gundo.vim'
Plug 'lambdalisue/suda.vim'
Plug 'ervandew/supertab'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'yuki-ycino/fzf-preview.vim'

Plug 'vimwiki/vimwiki'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'terryma/vim-multiple-cursors'
Plug 'justinmk/vim-sneak'
Plug 'ryanoasis/vim-devicons'
" Reading / note taking
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'godlygeek/tabular' " This belongs to vim-markdown
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Intellisense autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Colors
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'chriskempson/base16-vim'
Plug 'crusoexia/vim-monokai'
Plug 'plan9-for-vimspace/acme-colors'
Plug 'andreypopp/vim-colors-plain'
Plug 'noahfrederick/vim-hemisu'
Plug 'KKPMW/sacredforest-vim'
Plug 'lifepillar/vim-solarized8'
Plug 'andreasvc/vim-256noir'

call plug#end()

" }}}

" {{{ Plugin stuff

" SuperTab
let g:SuperTabLongestEnhanced=1
let g:SuperTabLongestHighlight=1
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" NERDTree
let NERDTreeIgnore = ['\.pyc$']

" Airline
if has("gui_running")
  "let g:airline_right_alt_sep = ''
  "let g:airline_right_sep = ''
  "let g:airline_left_alt_sep= ''
  "let g:airline_left_sep = ''
  "let g:airline_right_sep = ''
  "let g:airline_left_sep = ''
endif
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'
" Smart tab line
let g:airline#extensions#tabline#enabled = 1
" For combination with ALE
let g:airline#extensions#ale#enabled = 1

" ALE
" Lint when opening a file
let g:ale_lint_on_enter = 1
" Just lint on file save, not when changing
let g:ale_lint_on_text_changed = 'never'

" Restrict tex checkers to chktex?
" Restrict python checkers to flake8 + python?
"let g:ale_list_window_size = 4
"let g:ale_open_list = 1
let g:ale_sign_warning = '∙'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_fix_on_save = 0

" fzf-preview
" Specify the color of fzf
let g:fzf_preview_fzf_color_option = 'light'
let g:fzf_preview_command = 'bat --theme="ansi-dark" --color=always --style=grid {-1}' " Installed bat

" Vim sneak
let g:sneak#label = 1

" vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" disable the <tab> mapping provided by vimwiki, which interferes with SuperTab
let g:vimwiki_table_mappings = 0

" suda
let g:suda_smart_edit = 1


" }}}

" {{{ Final stuff
set nomore

syntax on

if $TERM == 'linux'
    let &t_Co = 8
    color peachpuff
    set nolist
    set colorcolumn+=81
    hi ColorColumn term=none cterm=none ctermbg=3
    hi CursorLine term=none cterm=none ctermbg=none
else
"    hi Cursorline term=none cterm=none ctermbg=17
  " colorscheme neverland-darker
  set t_Co=256
  "let base16colorspace=256
  set termguicolors
  set background=dark
  colorscheme solarized8
  "color dracula
endif
highlight MatchParen cterm=bold ctermfg=cyan
" }}}

