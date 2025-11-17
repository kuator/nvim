vim.pack.add({
  "https://github.com/kana/vim-textobj-user",
  "https://github.com/wellle/targets.vim",
  "https://github.com/kana/vim-textobj-entire",
  "https://github.com/kiyoon/treesitter-indent-object.nvim",
  "https://github.com/Julian/vim-textobj-variable-segment",
  "https://github.com/AndrewRadev/dsf.vim",

  "https://github.com/tommcdo/vim-lion",
  "https://github.com/ralismark/opsort.vim",

  "https://github.com/whatyouhide/vim-textobj-xmlattr",
  "https://github.com/christoomey/vim-sort-motion",

  "https://github.com/folke/ts-comments.nvim",
  "https://github.com/kana/vim-textobj-line",
  "https://github.com/johmsalas/text-case.nvim",
}, { load = true, confirm = false })


-- Treesitter Indent Object Mappings
local indent_obj = require'treesitter_indent_object.textobj'

-- Select context-aware indent (outer)
vim.keymap.set({'x', 'o'}, 'ai', indent_obj.select_indent_outer, { desc = "Select context-aware indent (outer)" })

-- Select context-aware indent (outer, line-wise)
vim.keymap.set({'x', 'o'}, 'aI', function()
  indent_obj.select_indent_outer(true)
end, { desc = "Select context-aware indent (outer, line-wise)" })

-- Select context-aware indent (inner, partial range)
vim.keymap.set({'x', 'o'}, 'ii', indent_obj.select_indent_inner, { desc = "Select context-aware indent (inner, partial range)" })

-- Select context-aware indent (inner, entire range) in line-wise visual mode
vim.keymap.set({'x', 'o'}, 'iI', function()
  indent_obj.select_indent_inner(true, 'V')
end, { desc = "Select context-aware indent (inner, entire range) in line-wise visual mode" })

require('ts-comments').setup{}
