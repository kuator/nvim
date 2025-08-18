
vim.pack.add({ "https://github.com/kana/vim-textobj-user" }, { load = true })
vim.pack.add({ "https://github.com/wellle/targets.vim" }, { load = true })
vim.pack.add({ "https://github.com/kana/vim-textobj-entire" }, { load = true })
vim.pack.add({ "https://github.com/Julian/vim-textobj-variable-segment"}, { load = true })
vim.pack.add({ "https://github.com/AndrewRadev/dsf.vim"}, { load = true })

vim.pack.add({ "https://github.com/tommcdo/vim-lion"}, { load = true })
vim.pack.add({ "https://github.com/ralismark/opsort.vim"}, { load = true })

vim.pack.add({ "https://github.com/whatyouhide/vim-textobj-xmlattr"}, { load = true })
vim.pack.add({ "https://github.com/christoomey/vim-sort-motion"}, { load = true })


vim.pack.add({ "https://github.com/folke/ts-comments.nvim" }, { load = true })
require('ts-comments').setup{}


vim.pack.add({ "https://github.com/kana/vim-textobj-line" }, { load = true })
-- vim.g.textobj_line_no_default_key_mappings = true
-- vim.api.nvim_set_keymap("o", "ir", "<Plug>(textobj-line-i)", {})
-- vim.api.nvim_set_keymap("x", "ir", "<Plug>(textobj-line-i)", {})
-- vim.api.nvim_set_keymap("o", "ar", "<Plug>(textobj-line-a)", {})
-- vim.api.nvim_set_keymap("x", "ar", "<Plug>(textobj-line-a)", {})
