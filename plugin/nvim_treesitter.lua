vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  "https://github.com/nvim-treesitter/nvim-treesitter-context",
  "https://github.com/hiphish/rainbow-delimiters.nvim",
  "https://github.com/windwp/nvim-ts-autotag",
  "https://github.com/danymat/neogen",
}, { load = true, confirm = false })

local ensure_installed = { "python", "lua", "bash", "json", "yaml", "html", "javascript", "java" }

local already_installed = require("nvim-treesitter").get_installed()

local parsers_to_install = vim
    .iter(ensure_installed)
    :filter(function(parser)
      return not vim.tbl_contains(already_installed, parser)
    end)
    :totable()

require("nvim-treesitter").install(parsers_to_install)

require("neogen").setup({ snippet_engine = "luasnip" })

vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

vim.api.nvim_create_autocmd("FileType", {
  pattern = ensure_installed,
  callback = function()
    vim.treesitter.start()
  end,
})
