return {
  "renerocksai/telekasten.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "https://github.com/renerocksai/calendar-vim",
  },
  keys = {
    -- { mode = "n", "<leader>tf" },
    { mode = "n", "<leader>ng" },
    { mode = "n", "<leader>nt" },
    { mode = "n", "<leader>nn" },
    -- { mode = "n", "<leader>tg" },
    -- { mode = "n", "<leader>tl" },
    -- { mode = "n", "<leader>tn" },
    -- { mode = "n", "<leader>tc" },
    -- { mode = "n", "<leader>tb" },
  },
  cmd = {"Telekasten"},
  config = function()
    require('telekasten').setup({
      home = vim.env.ZK_NOTEBOOK_DIR,
      dailies = vim.fs.joinpath(vim.env.ZK_NOTEBOOK_DIR, 'dailies'),       -- path to daily notes
      weeklies = vim.fs.joinpath(vim.env.ZK_NOTEBOOK_DIR, 'weekies'),       -- path to daily notes
      template_new_note = vim.fs.joinpath(vim.env.ZK_NOTEBOOK_DIR, '.zk/templates/default.md'),
      new_note_filename = 'title'
    })
    --
    -- vim.keymap.set("n", "<leader>tp", "<cmd>Telekasten panel<CR>")
    -- vim.keymap.set("n", "<leader>tf", "<cmd>Telekasten find_notes<CR>")


    local telekasten_grep = function ()
      require('telescope.builtin').live_grep { search_dirs = { vim.env.ZK_NOTEBOOK_DIR }, cwd =  vim.env.ZK_NOTEBOOK_DIR, prompt_title = "Search in notes" }
    end

    vim.keymap.set("n", "<leader>ng", telekasten_grep)

    vim.keymap.set("n", "<leader>nt", "<cmd>Telekasten show_tags<CR>")
    vim.keymap.set("n", "<leader>nf", "<cmd>Telekasten find_notes<CR>")
    vim.keymap.set("n", "<leader>nn", "<cmd>Telekasten new_note<CR>")
    -- vim.keymap.set("n", "<leader>tg", "<cmd>Telekasten goto_today<CR>")
    -- vim.keymap.set("n", "<leader>tl", "<cmd>Telekasten follow_link<CR>")
    -- vim.keymap.set("n", "<leader>tc", "<cmd>Telekasten show_calendar<CR>")
    -- vim.keymap.set("n", "<leader>tb", "<cmd>Telekasten show_backlinks<CR>")
  end,
}
