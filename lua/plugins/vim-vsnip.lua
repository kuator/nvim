-- NOTE: You can use other key to expand snippet.
return function ()
  vim.g.vsnip_snippet_dir=vim.fn.stdpath('config')..'/snippets'

  -- Expand or jump
  vim.api.nvim_set_keymap('i', '<expr><C-k>', [[vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-k>"]], {})
  vim.api.nvim_set_keymap('s', '<expr><C-k>', [[vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-k>"]], {})
  vim.api.nvim_set_keymap('x', '<expr><C-k>', [[vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-k>"]], {})
  vim.api.nvim_set_keymap('i', '<expr><C-j>', [[vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)"      : "<C-j>"]], {})
  vim.api.nvim_set_keymap('x', '<expr><C-j>', [[vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)"      : "<C-j>"]], {})
  vim.api.nvim_set_keymap('s', '<expr><C-j>', [[vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)"      : "<C-j>"]], {})

  vim.api.nvim_set_keymap('s', '<C-h>', '<Plug>(vsnip-cut-text)', {})
end
