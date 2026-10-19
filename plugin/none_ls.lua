local packages = {
  "mason-null-ls.nvim",
  "none-ls-extras.nvim",
  "plenary.nvim",
  "none-ls.nvim",
}

vim.pack.add({
  "https://github.com/jay-babu/mason-null-ls.nvim",
  "https://github.com/nvimtools/none-ls-extras.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvimtools/none-ls.nvim",
}, { load = false, confirm = false })

vim.api.nvim_create_autocmd("FileType", {
  -- LuaSnip completion applies to every normal filetype, so none-ls must be
  -- available even when no formatter or diagnostic source matches.
  pattern = "*",
  once = true,
  callback = function(args)
    require("config.lazy").load(packages, "config.none_ls")
    require("null-ls.client").try_add(args.buf)
  end,
})

require("config.lazy").commands("NullLs*", packages, "config.none_ls")
require("config.lazy").commands("NoneLs*", packages, "config.none_ls")
