vim.pack.add({ "http://github.com/chrisgrieser/nvim-origami" }, { load = false, confirm = false })

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    if vim.bo[args.buf].buftype ~= "" then
      return
    end
    require("config.lazy").load({ "nvim-origami" }, "config.origami")
    return true
  end,
})
