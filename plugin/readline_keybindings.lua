vim.pack.add({ "https://github.com/tpope/vim-rsi" }, { load = false, confirm = false })

vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
  once = true,
  callback = function()
    require("config.lazy").load({ "vim-rsi" })
  end,
})
