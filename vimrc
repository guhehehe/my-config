set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/powerline/bindings/vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

" UltiSnips
Plugin 'SirVer/ultisnips'      " Track the engine.
Plugin 'honza/vim-snippets'    " Snippets are separated from the engine. Add this if you want them:

call vundle#end()            " required
filetype plugin indent on    " required




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
set cursorline
set hlsearch
set ttymouse=sgr         " Set the terminal mode for mouse behavior.
set tags=./tags;
set ttyfast              " You got a fast terminal, I don't know how you did it.
set ttyscroll=3          " Wtf is this?
set lazyredraw           " To avoid scrolling problems by buffering the screen rendering
set synmaxcol=128        " Limit syntax highlighting to avoid getting slow when highlighting long lines.
set noshowmode           " Don't show mode bar, since powerline does this.
set laststatus=2
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8
set guifont=DejaVuSansMono\ for\ Powerline:h15
set relativenumber

" Toggle between relative line number and absolute number.
function! NumberToggle()
    if(&relativenumber == 1)
        set relativenumber!
    else
        set relativenumber
    endif
endfunc

" Mapping with alt key on Mac
" <M-h> ˙
imap ˙ ()<Esc>i
" <M-j> ∆
imap ∆ []<Esc>i
" <M-k> ˚
imap ˚ {}<Esc>i
" <M-f> ƒ
imap ƒ ''<Esc>i
" <M-d> ∂
imap ∂ ""<Esc>i
" <M-l> ¬
imap ¬ <Esc>wa

" Toggle relative line nubmers
nmap <C-x> :call NumberToggle()<cr>

" Window movement.
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h

nmap <S-s> :w<CR>
nmap <S-q> :wq<CR>
nmap <C-w>q :q!<CR>
nmap - <C-w>-
nmap + <C-w>+

" Tab movement.
nmap <C-n> gT
nmap <C-m> gt

" NERDTree commands
nmap <C-t>t :NERDTree<CR>
nmap <C-t>c :NERDTreeClose<CR>
nmap <C-t>f :NERDTreeFind
nmap <C-t>. :NERDTreeCWD<CR>

" Toggle indentLines
nmap <c-i>i :IndentLinesToggle<CR>

" ctags commands
nmap <C-c>t :tags /Users/hegu/venvprojects/starmaker/gae/.git/tags

inoremap <S-tab> <BS><BS><BS><BS>

" zz lets the cursor to be placed in the middle of the screen
nnoremap n nzz
nnoremap N Nzz
" nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" I want * to display all matches w/o cursor movement
nnoremap * :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" Press Space to turn off highlighting and clear any message already
" displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

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
" See https://github.com/tpope/vim-pathogen for more details.
" call pathogen#infect()
" call pathogen#helptags()
" syntax on
" filetype plugin indent on



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
" indentLine commands
""""""""""""""""""""""""""""""""
" See https://github.com/Yggdroot/indentLine for details.

let g:indentLine_indentLevel = 10
let g:indentLine_color_term = 237
let g:indentLine_color_tty_light = 7
let g:indentLine_color_tty_dark = 1
let g:indentLine_char = '¦'



""""""""""""""""""""""""""""""""
" ConqueTerm commands
""""""""""""""""""""""""""""""""
" See https://code.google.com/p/conque/wiki/Usage for details.

nmap <C-w>t :ConqueTermSplit bash<CR><Esc>:resize 10<CR>i

let g:ConqueTerm_FastMode = 1

if has("gui_running")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        set guifont=DejaVuSansMono\ for\ Powerline:h15
    endif
endif
let g:ConqueTerm_Color = 0        " Enable terminal color.



""""""""""""""""""""""""""""""""
" python.vim commands
""""""""""""""""""""""""""""""""
let python_highlight_all = 1     " Highlight all.



""""""""""""""""""""""""""""""""
" powerLine commands
""""""""""""""""""""""""""""""""
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
 
let g:Powerline_symbols = 'unicode'
let g:Powerline_symbols = 'fancy'
" 
" 
" if has("gui_running")
"     let s:uname = system("uname")
"     if s:uname == "Darwin\n"
"         set guifont=DejaVuSansMono\ for\ Powerline:h15
"     endif
" endif
" 
" Fix two escape to exit insert mode.
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif



""""""""""""""""""""""""""""""""
" ctrlp commands
""""""""""""""""""""""""""""""""
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_max_files=0



""""""""""""""""""""""""""""""""
" tagbar commands
""""""""""""""""""""""""""""""""
nmap <C-b> :TagbarToggle<CR>
let g:tagbar_autofocus=1      " Make tagbar get focused when it is fired up.
let g:tagbar_show_linenumbers=1
set updatetime=0



""""""""""""""""""""""""""""""""
" Customized highlights 
""""""""""""""""""""""""""""""""
syn match Identifier " self\." 



""""""""""""""""""""""""""""""""
" YouCompleteMe settings
""""""""""""""""""""""""""""""""
let g:ycm_autoclose_preview_window_after_completion=1




""""""""""""""""""""""""""""""""
" UltiSnips settings
""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-k>"
let g:UltiSnipsJumpBackwardTrigger="<C-l>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsUsePythonVersion=2
