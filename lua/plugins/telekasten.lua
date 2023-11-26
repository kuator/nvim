return {
  'renerocksai/telekasten.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'mickael-menu/zk-nvim'
  },
  keys = {
    { mode="n"; "<leader>tf" },
    { mode="n"; "<leader>ts" },
    { mode="n"; "<leader>tg" },
    { mode="n"; "<leader>tl" },
    { mode="n"; "<leader>tn" },
    { mode="n"; "<leader>tc" },
    { mode="n"; "<leader>tb" },
  },
  config = function ()
    require('telekasten').setup({
      home = vim.fn.expand("~/zettelkasten"), -- Put the name of your notes directory here
    })
    -- Launch panel if nothing is typed after <leader>z
    vim.keymap.set("n", "<leader>tp", "<cmd>Telekasten panel<CR>")

    -- Most used functions

    vim.keymap.set("n", "<leader>tf", "<cmd>Telekasten find_notes<CR>")
    vim.keymap.set("n", "<leader>ts", "<cmd>Telekasten search_notes<CR>")
    vim.keymap.set("n", "<leader>tg", "<cmd>Telekasten goto_today<CR>")
    vim.keymap.set("n", "<leader>tl", "<cmd>Telekasten follow_link<CR>")
    vim.keymap.set("n", "<leader>tn", "<cmd>Telekasten new_note<CR>")
    vim.keymap.set("n", "<leader>tc", "<cmd>Telekasten show_calendar<CR>")
    vim.keymap.set("n", "<leader>tb", "<cmd>Telekasten show_backlinks<CR>")

    -- vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>")

    -- Call insert link automatically when we start typing a link
    -- vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")
  end
}
