return function ()
  vim.api.nvim_set_keymap('n', '<leader>tf', '<cmd>Telescope find_files<cr>', {noremap=true})
end
