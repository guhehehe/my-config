" Vim color file
" Maintainer: He Gu

set background=dark
set t_Co=256
let g:colors_name="256-jungle"

let python_highlight_all = 1
let c_gnu = 1

hi ColorColumn        ctermfg=None        ctermbg=235         cterm=None
hi Comment            ctermfg=239         ctermbg=None        cterm=None
hi Constant           ctermfg=64          ctermbg=None        cterm=None
hi Cursor             ctermfg=253         ctermbg=57          cterm=None
hi CursorLine         ctermfg=None        ctermbg=235         cterm=Bold
hi DiffText           ctermfg=165         ctermbg=244         cterm=None
hi Directory          ctermfg=24          ctermbg=None        cterm=Bold
hi Error              ctermfg=None        ctermbg=9           cterm=Bold
hi ErrorMsg           ctermfg=160         ctermbg=245         cterm=None
hi FoldColumn         ctermfg=132         ctermbg=None        cterm=None
hi Folded             ctermfg=132         ctermbg=None        cterm=Bold
hi Identifier         ctermfg=172         ctermbg=None        cterm=Bold
hi Ignore             ctermfg=221         ctermbg=None        cterm=Bold
hi LineNr             ctermfg=244         ctermbg=234         cterm=None
hi NonText            ctermfg=244         ctermbg=None        cterm=None
hi Normal             ctermfg=246         ctermbg=None        cterm=None
hi Pmenu              ctermfg=62          ctermbg=233         cterm=None
hi PmenuSbar          ctermfg=247         ctermbg=233         cterm=Bold
hi PmenuSel           ctermfg=69          ctermbg=232         cterm=Bold
hi PmenuThumb         ctermfg=248         ctermbg=233         cterm=None
hi PreProc            ctermfg=24          ctermbg=None        cterm=Bold
hi Search             ctermfg=None        ctermbg=148         cterm=Bold
hi Special            ctermfg=172         ctermbg=None        cterm=Bold
hi SpecialKey         ctermfg=70          ctermbg=None        cterm=None
hi Statement          ctermfg=130         ctermbg=None        cterm=Bold
hi StatusLine         ctermfg=39          ctermbg=239         cterm=None
hi StatusLineNC       ctermfg=248         ctermbg=239         cterm=None
hi TabLine            ctermfg=245         ctermbg=239         cterm=None
hi TabLineFill        ctermfg=239         ctermbg=239         cterm=None
hi TabLineSel         ctermfg=104         ctermbg=236         cterm=Bold
hi Title              ctermfg=64          ctermbg=None        cterm=None
hi Todo               ctermfg=162         ctermbg=None        cterm=Bold
hi Type               ctermfg=9           ctermbg=None        cterm=Bold
hi Underline          ctermfg=147         ctermbg=None        cterm=None
hi VertSplit          ctermfg=239         ctermbg=239         cterm=None
hi Visual             ctermfg=248         ctermbg=238         cterm=None


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Customized settings.                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight extra spaces at then end of each line.
hi ExtraWhitespace    ctermfg=None        ctermbg=9           cterm=None
match ExtraWhitespace /\s\+$/

" Linked by python.vim
hi cusPythonOperator  ctermfg=130         ctermbg=None        cterm=None
hi cusPythonFuncArgs  ctermfg=24          ctermbg=None        cterm=Bold
hi cusPythonClsSelf   ctermfg=166         ctermbg=None        cterm=Bold
hi cusPythonObjRef    ctermfg=124         ctermbg=None        cterm=None

"vim: sw=4
