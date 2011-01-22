"---------------------------------
" file:             .vimrc
" author:           keks
" last modified:    January 2011  
"---------------------------------

" usefull settings
set nocompatible
" intending
set ai
set smartindent

" encoding
set fileencoding=utf-8
set tenc=utf-8

filetype on
filetype indent on
filetype plugin on
set ignorecase

" show line numbers
set nu

" no backup 
set noswapfile

" text layout
set tabstop=4
set backspace=2
set expandtab "for discussion
set textwidth=79

" searching
set incsearch hlsearch

" au foo
" python stuff
au Filetype python setlocal tabstop=4
au Filetype python setlocal shiftwidth=4
au Filetype python setlocal smarttab
au Filetype python setlocal expandtab
au Filetype python setlocal softtabstop=4
au Filetype python setlocal autoindent
au Filetype python setlocal tw=79
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
"nerdtree
map <F3> <Esc>:NERDTreeToggle<CR> 

" look
syntax on
set t_Co=256
colorscheme neverland-ansi_bg
set cul
set foldmethod=marker
hi Cursorline term=none cterm=none ctermbg=17 "17
