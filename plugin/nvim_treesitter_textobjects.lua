vim.pack.add({{
  src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
  version = "main",
}}, { load = true, confirm = false })


require("nvim-treesitter-textobjects").setup({
  select = {
    enable = true,

    lookahead = true,

    include_surrounding_whitespace = false,

    selection_modes = {
      ["@parameter.outer"] = "v", -- charwise
      ["@function.outer"] = "V",  -- linewise
      ["@class.outer"] = "V",     -- blockwise
    },
  },
})

vim.keymap.set({ "x", "o" }, "af", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "if", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "aC", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "iC", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
end)
-- You can also use captures from other query groups like `locals.scm`
vim.keymap.set({ "x", "o" }, "as", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@local.scope", "locals")
end)


vim.keymap.set({ "n" }, "<a-l>", function()
  require("nvim-treesitter-textobjects.swap").swap_next({ "@parameter.inner", "@statement.outer", "@function.outer" })
end)

vim.keymap.set("n", "<a-h>", function()
  require("nvim-treesitter-textobjects.swap").swap_previous({
    "@parameter.inner",
    "@statement.outer",
    "@function.outer",
  })
end)
