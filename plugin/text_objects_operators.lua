vim.pack.add({
  { src = "https://github.com/kana/vim-textobj-user" },
  { src = "https://github.com/wellle/targets.vim" },
  { src = "https://github.com/kana/vim-textobj-entire" },
  { src = "https://github.com/Julian/vim-textobj-variable-segment" },
  { src = "https://github.com/AndrewRadev/dsf.vim" },

  { src = "https://github.com/tommcdo/vim-lion" },
  { src = "https://github.com/ralismark/opsort.vim" },

  { src = "https://github.com/whatyouhide/vim-textobj-xmlattr" },
  { src = "https://github.com/christoomey/vim-sort-motion" },

  { src = "https://github.com/folke/ts-comments.nvim" },
  { src = "https://github.com/kana/vim-textobj-line" },
  { src = "https://github.com/johmsalas/text-case.nvim" },
}, { load = true })

require('ts-comments').setup{}
