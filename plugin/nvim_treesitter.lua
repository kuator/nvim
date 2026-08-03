local packages = {
  "nvim-treesitter",
  "nvim-treesitter-context",
  "rainbow-delimiters.nvim",
  "nvim-ts-autotag",
  "neogen",
  "nvim-treesitter-textobjects",
  "treesitter-unit",
}

vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  "https://github.com/nvim-treesitter/nvim-treesitter-context",
  "https://github.com/hiphish/rainbow-delimiters.nvim",
  "https://github.com/windwp/nvim-ts-autotag",
  "https://github.com/danymat/neogen",
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
    version = "main",
  },
  "https://github.com/David-Kunz/treesitter-unit",
}, { load = false, confirm = false })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "lua", "bash", "json", "yaml", "html", "javascript", "java" },
  callback = function(args)
    local lazy = require("config.lazy")
    lazy.load(packages, "config.nvim_treesitter")
    lazy.load(packages, "config.nvim_treesitter_textobjects")
    lazy.load(packages, "config.treesitter_unit")
    vim.treesitter.start(args.buf)
    vim.bo[args.buf].indentexpr = require("nvim-treesitter").indentexpr
    local rainbow_config = require("rainbow-delimiters.config")
    local lang = vim.treesitter.language.get_lang(args.match)
    if rainbow_config.enabled_for(lang) and rainbow_config.enabled_when(args.buf) then
      require("rainbow-delimiters.lib").attach(args.buf)
    end
  end,
})

local lazy = require("config.lazy")
lazy.commands("TS*", packages, "config.nvim_treesitter")
lazy.commands("Neogen", packages, "config.nvim_treesitter")
