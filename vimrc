""""""""""""""""""""""""""""""""
" basic commands
""""""""""""""""""""""""""""""""
syntax enable

set nu
set tabstop=4
set shiftwidth=4
set expandtab            " Set tab to spaces.
set t_Co=256             " More colorful syntax highlighting.
set background=dark      " Better color map for syntax highlighting.
set mouse=a              " Enable mouse mode.
set autoindent
set splitbelow

" Window movement.
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h

map <S-s> :w<CR>
map <S-q> :wq<CR>
map <C-t>t :NERDTree<CR>
map <C-t>c :NERDTreeClose<CR>
map <C-t>f :NERDTreeFind
map <C-t>. :NERDTreeCWD<CR>
map <C-w>q :q!<CR>
map <C-w>t :ConqueTermSplit bash<CR><Esc>:resize 10<CR>i
map - <C-w>-
map + <C-w>+
    
"imap <tab> <Space><Space><Space><Space>
imap <S-tab> <BS><BS><BS><BS>

colorscheme 256-jungle

" For python programming convention only.
" Highlighting the part after 79th character.
nnoremap <Leader>H :call<SID>LongLineHLToggle()<cr>
hi OverLength ctermbg=none cterm=none
match OverLength /\%>79v/
fun! s:LongLineHLToggle()
    if !exists('w:longlinehl')
        let w:longlinehl = matchadd('ErrorMsg', '.\%>80v', 0)
        echo "Long lines highlighted"
    else
        call matchdelete(w:longlinehl)
        unl w:longlinehl
        echo "Long lines unhighlighted"
    endif
endfunction



""""""""""""""""""""""""""""""""
" Pathogen commands
""""""""""""""""""""""""""""""""
execute pathogen#infect()
filetype plugin indent on



""""""""""""""""""""""""""""""""
" Solarized commands
""""""""""""""""""""""""""""""""
" See https://github.com/altercation/vim-colors-solarized/blob/master/README.mkd 
" for details.

" let g:solarized_termcolors=256 " Only if you don't want to use solarized shell color.
" let g:solarized_contrast
" let g:solarized_visibility
" let g:solarized_termtrans=1
" colorscheme solarized



""""""""""""""""""""""""""""""""
" Indent guide commands 
""""""""""""""""""""""""""""""""
" See https://github.com/nathanaelkane/vim-indent-guides for details.
" Use <Leader>ig to toggle the plugin.

let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red     ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=  ctermbg=4
hi IndentGuidesOdd  ctermbg=240
hi IndentGuidesEven ctermbg=235
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=1



""""""""""""""""""""""""""""""""
" ConqueTerm commands
""""""""""""""""""""""""""""""""
" See https://code.google.com/p/conque/wiki/Usage for details.

let g:ConqueTerm_FastMode = 1
let g:ConqueTerm_Color = 0        " Enable terminal color.



""""""""""""""""""""""""""""""""
" python.vim commands
""""""""""""""""""""""""""""""""
let Python3Syntax = 0            " Disable python 3 syntax highlighting.
let python_highlight_all = 1     " Highlight all.
