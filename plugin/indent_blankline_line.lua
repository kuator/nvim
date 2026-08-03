if vim.g.vscode then
  return
end

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  once = true,
  callback = function()
    vim.pack.add({
      "https://github.com/lukas-reineke/indent-blankline.nvim",
    }, { load = true, confirm = false })
    require("config.indent_blankline")
  end,
})
