" TeX specific stuff - loaded on filetype detection
" expand tabs to spaces, use 2 for tabs, expanded tabs and indentation
setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2

setlocal norelativenumber
setlocal number
setlocal nocursorline
setlocal noshowmatch

au BufRead,BufNewFile *.tex let g:tex_flavor = "latex"
setlocal grepprg=grep\ -nH\ $*
setlocal runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
