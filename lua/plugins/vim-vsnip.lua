return function ()
  vim.g.vsnip_snippet_dir=vim.fn.stdpath('config')..'/snippets'

  -- Expand or jump
  vim.api.nvim_set_keymap('i', '<C-k>', [[vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-k>"]], {expr=true})
  vim.api.nvim_set_keymap('s', '<C-k>', [[vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-k>"]], {expr=true})
  vim.api.nvim_set_keymap('x', '<C-k>', [[vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-k>"]], {expr=true})
  vim.api.nvim_set_keymap('i', '<C-j>', [[vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)"      : "<C-j>"]], {expr=true})
  vim.api.nvim_set_keymap('x', '<C-j>', [[vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)"      : "<C-j>"]], {expr=true})
  vim.api.nvim_set_keymap('s', '<C-j>', [[vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)"      : "<C-j>"]], {expr=true})

  vim.api.nvim_set_keymap('s', '<C-h>', '<Plug>(vsnip-cut-text)', {})
end
