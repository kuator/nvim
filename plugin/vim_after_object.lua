vim.pack.add({ "https://github.com/junegunn/vim-after-object" }, { load = true })

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.fn["after_object#enable"]('=', ':', '-', '#', ' ')
  end,
})
