return {
  'liuchengxu/space-vim-dark',
  config = function()
    vim.cmd('colorscheme space-vim-dark')
    vim.cmd('hi Normal     ctermbg=NONE guibg=NONE')
    vim.cmd('hi LineNr     ctermbg=NONE guibg=NONE')
    vim.cmd('hi SignColumn ctermbg=NONE guibg=NONE')
    vim.cmd('hi CursorLineNr ctermbg=NONE guibg=NONE')
    vim.cmd('hi LineNr guifg=white guibg=NONE ctermfg=white ctermbg=NONE')
    vim.cmd('hi Comment cterm=italic gui=italic')
  end
}
