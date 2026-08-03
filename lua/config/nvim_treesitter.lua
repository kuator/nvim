local ensure_installed = { "python", "lua", "bash", "json", "yaml", "html", "javascript", "java" }

local already_installed = require("nvim-treesitter").get_installed()

local parsers_to_install = vim
    .iter(ensure_installed)
    :filter(function(parser)
      return not vim.tbl_contains(already_installed, parser)
    end)
    :totable()

require("nvim-treesitter").install(parsers_to_install)

require("config.lazy").load({ "vim-snippets", "LuaSnip" }, "config.luasnip")
require("neogen").setup({ snippet_engine = "luasnip" })
