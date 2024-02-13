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
    { mode = "n", "<leader>nf" },
    { mode = "n", "<leader>ncd" },
    { mode = "n", "<leader>ne" },
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
      new_note_filename = 'title',
      show_tags_theme = 'ivy',
      filename_space_subst = '_',
    })
    --
    -- vim.keymap.set("n", "<leader>tp", "<cmd>Telekasten panel<CR>")
    -- vim.keymap.set("n", "<leader>tf", "<cmd>Telekasten find_notes<CR>")


    local function telekasten_grep()
      require('telescope.builtin').grep_string {
        path_display='tail',
        only_sort_text = true,
        word_match = "-w",
        search = '',
        search_dirs = { vim.env.ZK_NOTEBOOK_DIR },
        cwd =  vim.env.ZK_NOTEBOOK_DIR,
        prompt_title = "Search in notes",
      }
    end

    local function telekasten_find_notes ()
      require'telescope.builtin'.find_files(
        require('telescope.themes').get_dropdown({
          cwd=vim.env.ZK_NOTEBOOK_DIR,
          -- shorten_path = true,
          find_command = {
            "fd",
            "-emd",
            "-E.zk",
            "--no-ignore-vcs",
            "--hidden",
            "--ignore-file",
            vim.fs.joinpath(vim.env.XDG_CONFIG_HOME, '.ignore')
          }
        }
        )
      )
    end

    vim.keymap.set("n", "<leader>ng", telekasten_grep)

    vim.keymap.set("n", "<leader>nt", "<cmd>Telekasten show_tags<CR>")

    -- vim.keymap.set("n", "<leader>ne", "<cmd>ne <c-r>=$ZK_NOTEBOOK_DIR<cr>")

    vim.cmd([[nnoremap <leader>ne  :edit <c-r>=$ZK_NOTEBOOK_DIR . '/*'<cr>]])

    vim.keymap.set("n", "<leader>nf", telekasten_find_notes)

    vim.keymap.set("n", "<leader>nn", "<cmd>Telekasten new_note<CR>")

    vim.keymap.set("n", "<leader>ncd", ":silent lcd " .. vim.env.ZK_NOTEBOOK_DIR .. "<CR>")


    -- vim.keymap.set("n", "<leader>tg", "<cmd>Telekasten goto_today<CR>")
    -- vim.keymap.set("n", "<leader>tl", "<cmd>Telekasten follow_link<CR>")
    -- vim.keymap.set("n", "<leader>tc", "<cmd>Telekasten show_calendar<CR>")
    -- vim.keymap.set("n", "<leader>tb", "<cmd>Telekasten show_backlinks<CR>")
  end,
}
