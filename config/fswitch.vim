" #############################################################################
" fswitch for switching between header and source
" #############################################################################

au BufEnter *.h  let b:fswitchdst = "c,cpp,cc,m"
au BufEnter *.cc let b:fswitchdst = "h,hpp"

au BufEnter *.h let b:fswitchdst = 'c,cpp,m,cc' | let b:fswitchlocs = 'reg:|include.*|src/**|'

nnoremap <silent> <localleader>ss :FSHere<cr>
" Extra hotkeys to open header/source in the split
"nnoremap <silent> <localleader>sh :FSSplitLeft<cr>
"nnoremap <silent> <localleader>sj :FSSplitBelow<cr>
"nnoremap <silent> <localleader>sk :FSSplitAbove<cr>
"nnoremap <silent> <localleader>sl :FSSplitRight<cr>
