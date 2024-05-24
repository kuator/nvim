local config = {
  ensure_installed = { "python", "lua", "bash", "cpp" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  matchup = {
    enable = true,
  },
}

local matchup = {
  "andymass/vim-matchup",
  setup = function()
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
  end,
  disable = { "html" },
}

local treesitter_context = { "nvim-treesitter/nvim-treesitter-context" }

local textobjects = {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  config = function()
    require("nvim-treesitter-textobjects").setup()

    local select_textobject = require("nvim-treesitter-textobjects.select").select_textobject
    -- keymaps
    -- You can use the capture groups defined in `textobjects.scm`
    vim.keymap.set({ "x", "o" }, "af", function()
      select_textobject("@function.outer", "textobjects")
    end)
    vim.keymap.set({ "x", "o" }, "if", function()
      select_textobject("@function.inner", "textobjects")
    end)
    vim.keymap.set({ "x", "o" }, "aC", function()
      select_textobject("@class.outer", "textobjects")
    end)
    vim.keymap.set({ "x", "o" }, "iC", function()
      select_textobject("@class.inner", "textobjects")
    end)
    -- You can also use captures from other query groups like `locals.scm`
    vim.keymap.set({ "x", "o" }, "is", function()
      select_textobject("@local.scope", "locals")
    end)

    local swap = require("nvim-treesitter-textobjects.swap")
    vim.keymap.set("n", "<a-l>", swap.swap_next({ "@parameter.inner", "@statement.outer", "@function.outer" }))
    vim.keymap.set("n", "<a-h>", swap.swap_previous({ "@parameter.inner", "@statement.outer", "@function.outer" }))

  end,
}

local rainbow_delimiters = { "hiphish/rainbow-delimiters.nvim" }
local autotag = { "windwp/nvim-ts-autotag" }

local neogen = {
  "danymat/neogen",
  config = function()
    require("neogen").setup({ snippet_engine = "luasnip" })
  end,
}

local dependencies = {
  rainbow_delimiters,
  neogen,
  autotag,
  matchup,
  textobjects,
  treesitter_context,
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup(config)
    end,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = dependencies,
  },
}
