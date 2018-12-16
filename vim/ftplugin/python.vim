" python specific stuff - loaded on filetype detection
" expand tabs to spaces, use 4 for tabs, expanded tabs and indentation
setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4

" used by colorcolumn and wrapping
setlocal textwidth=79

" deactivate automatic formatting for text (prevents wrapping at textwidth)
setlocal formatoptions-=t

" automatically format comments
setlocal formatoptions+=c

" allow wrapping of sphinx-style comments
setlocal comments+=b:#:

" highlight additional whitespaces
highlight BadWhitespace ctermbg=red guibg=red
match BadWhitespace /^\t\+/
match BadWhitespace /\s\+$/

"ALE (https://github.com/w0rp/ale)
let b:ale_linters = ['flake8']
let b:ale_fixers = ['yapf']
