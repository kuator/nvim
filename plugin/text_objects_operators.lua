vim.pack.add({
  "https://github.com/kana/vim-textobj-user",
  "https://github.com/wellle/targets.vim",
  "https://github.com/kana/vim-textobj-entire",
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

require('ts-comments').setup{}
