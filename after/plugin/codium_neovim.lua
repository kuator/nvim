if vim.g.vscode then
    vim.cmd[[nnoremap <C-w><C-j> <nop>]]
    vim.cmd[[xnoremap <C-w><C-j> <nop>]]
    vim.cmd[[nnoremap <C-w><C-k> <nop>]]
    vim.cmd[[xnoremap <C-w><C-k> <nop>]]
    vim.cmd[[nnoremap <C-w><C-h> <nop>]]
    vim.cmd[[xnoremap <C-w><C-h> <nop>]]
    vim.cmd[[nnoremap <C-w><C-l> <nop>]]
    vim.cmd[[xnoremap <C-w><C-l> <nop>]]

    vim.cmd[[
      " window navigation
      nnoremap <C-w><c-j> <Cmd>call VSCodeNotify('workbench.action.navigateDown')<CR>
      xnoremap <C-w><c-j> <Cmd>call VSCodeNotify('workbench.action.navigateDown')<CR>
      nnoremap <C-w><c-k> <Cmd>call VSCodeNotify('workbench.action.navigateUp')<CR>
      xnoremap <C-w><c-k> <Cmd>call VSCodeNotify('workbench.action.navigateUp')<CR>
      nnoremap <C-w><c-h> <Cmd>call VSCodeNotify('workbench.action.navigateLeft')<CR>
      xnoremap <C-w><c-h> <Cmd>call VSCodeNotify('workbench.action.navigateLeft')<CR>
      nnoremap <C-w><c-l> <Cmd>call VSCodeNotify('workbench.action.navigateRight')<CR>
      xnoremap <C-w><c-l> <Cmd>call VSCodeNotify('workbench.action.navigateRight')<CR>
    ]]
    
else
    -- ordinary Neovim
end

