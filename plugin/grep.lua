if vim.fn.executable("rg") == 0 then
  return 
end

vim.o.grepprg = 'rg --vimgrep --no-heading --hidden --smart-case --no-ignore-vcs --ignore-file $XDG_CONFIG_HOME/.ignore'
vim.o.grepformat = '%f:%l:%c:%m,%f:%l:%m'
vim.keymap.set('n', '<leader>lg', ':silent lgrep<space>')
