-- C/C++ fswitch, switch between header and source
vim.cmd [[
  au BufEnter *.h  let b:fswitchdst = "c,cpp,cc,m"
  au BufEnter *.cc let b:fswitchdst = "h,hpp"
  au BufEnter *.h let b:fswitchdst = 'c,cpp,m,cc' | let b:fswitchlocs = 'reg:|include.*|src/**|'
]]
