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
