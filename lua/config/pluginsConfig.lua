-- Airline config --
vim.g['airline_theme'] = 'onedark'
vim.g['airline_powerline_fonts'] = 1
vim.g['airline#extensions#tabline#enabled'] = 0

-- fswitch --
-- C/C++ fswitch, switch between header and source
vim.cmd [[
  au BufEnter *.h  let b:fswitchdst = "c,cpp,cc,m"
  au BufEnter *.cc let b:fswitchdst = "h,hpp"
  au BufEnter *.h let b:fswitchdst = 'c,cpp,m,cc' | let b:fswitchlocs = 'reg:|include.*|src/**|'
]]

-- fzf --
vim.g['fzf_command_prefix'] = 'Fzf'
vim.g['fzf_preview_windows'] = "'right:50%', 'crtl-/'"

vim.cmd [[
  " Config ripgrep to not grep in file names
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --smart-case --no-heading --color=always '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%')
    \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%', '?'),
    \   <bang>0)
]]

-- gitgutter --
vim.cmd("set updatetime=100")
vim.g['gitgutter_sign_added'] = '+'
vim.g['gitgutter_sign_modified'] = '~'
vim.g['gitgutter_sign_removed'] = '-'
vim.g['gitgutter_sign_removed_first_line'] = '^'
vim.g['gitgutter_sign_modified_removed'] = 'w'

-- vimWiki --
vim.cmd("let g:vimwiki_list = [{'path': '~/.config/vimwiki/', 'path_html': '~/.config/vimwiki/html/', 'auto_toc': 1}]")
