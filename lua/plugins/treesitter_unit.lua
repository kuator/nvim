return {
  'David-Kunz/treesitter-unit' ,
  -- keys = {
  --   {mode='o'; 'iu'};
  --   {mode='x'; 'iu'};
  --   {mode='o'; 'au'};
  --   {mode='x'; 'au'};
  -- };
  config = function()
    vim.api.nvim_set_keymap('x', 'iu', ':lua require"treesitter-unit".select()<CR>', {noremap=true})
    vim.api.nvim_set_keymap('x', 'au', ':lua require"treesitter-unit".select(true)<CR>', {noremap=true})
    vim.api.nvim_set_keymap('o', 'iu', ':<c-u>lua require"treesitter-unit".select()<CR>', {noremap=true})
    vim.api.nvim_set_keymap('o', 'au', ':<c-u>lua require"treesitter-unit".select(true)<CR>', {noremap=true})
    require"treesitter-unit".enable_highlighting('CursorLine')
  end,
  event = { "BufReadPre", "BufNewFile" },
}
