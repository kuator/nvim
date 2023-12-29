return {
  "renerocksai/telekasten.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    {
      "mickael-menu/zk-nvim",
      config = function()
        require("zk").setup()
      end,
    },
  },
  keys = {
    { mode = "n", "<leader>tf" },
    { mode = "n", "<leader>ts" },
    { mode = "n", "<leader>tg" },
    { mode = "n", "<leader>tl" },
    { mode = "n", "<leader>tn" },
    { mode = "n", "<leader>tc" },
    { mode = "n", "<leader>tb" },
  },
  config = function()
    -- require('telekasten').setup({
    --   home = vim.fn.expand("~/zettelkasten"),
    -- })
    --
    -- vim.keymap.set("n", "<leader>tp", "<cmd>Telekasten panel<CR>")
    -- vim.keymap.set("n", "<leader>tf", "<cmd>Telekasten find_notes<CR>")
    -- vim.keymap.set("n", "<leader>ts", "<cmd>Telekasten search_notes<CR>")
    -- vim.keymap.set("n", "<leader>tg", "<cmd>Telekasten goto_today<CR>")
    -- vim.keymap.set("n", "<leader>tl", "<cmd>Telekasten follow_link<CR>")
    -- vim.keymap.set("n", "<leader>tn", "<cmd>Telekasten new_note<CR>")
    -- vim.keymap.set("n", "<leader>tc", "<cmd>Telekasten show_calendar<CR>")
    -- vim.keymap.set("n", "<leader>tb", "<cmd>Telekasten show_backlinks<CR>")
  end,
}
