-- https://github.com/mhinz/vim-startify/pull/250
vim.g.startify_session_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/")
vim.g.startify_padding_left = 20
vim.pack.add({ { src = "https://github.com/mhinz/vim-startify", version = "master" } }, { load = true, confirm = false })
