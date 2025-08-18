if not vim.g.vscode then
  return
end

local opts = { noremap = true, silent = true }

-- Disable default behavior
vim.keymap.set({ 'n', 'x' }, '<C-w><C-j>', '<nop>', opts)
vim.keymap.set({ 'n', 'x' }, '<C-w><C-k>', '<nop>', opts)
vim.keymap.set({ 'n', 'x' }, '<C-w><C-h>', '<nop>', opts)
vim.keymap.set({ 'n', 'x' }, '<C-w><C-l>', '<nop>', opts)

-- Remap to VSCode window navigation
vim.keymap.set({ 'n', 'x' }, '<C-w><C-j>', '<Cmd>call VSCodeNotify("workbench.action.navigateDown")<CR>', opts)
vim.keymap.set({ 'n', 'x' }, '<C-w><C-k>', '<Cmd>call VSCodeNotify("workbench.action.navigateUp")<CR>', opts)
vim.keymap.set({ 'n', 'x' }, '<C-w><C-h>', '<Cmd>call VSCodeNotify("workbench.action.navigateLeft")<CR>', opts)
vim.keymap.set({ 'n', 'x' }, '<C-w><C-l>', '<Cmd>call VSCodeNotify("workbench.action.navigateRight")<CR>', opts)
