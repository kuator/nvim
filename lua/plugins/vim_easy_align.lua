return {
  'https://github.com/junegunn/vim-easy-align',
  config = function ()
    vim.keymap.set("n", "ga", "<Plug>(EasyAlign)", { desc = "Easy align" })
    vim.keymap.set("x", "ga", "<Plug>(EasyAlign)", { desc = "Easy align" })
  end,
  keys = {
    { mode = 'n', 'ga' },
    { mode = 'x', 'ga' },
  },
}
