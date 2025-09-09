vim.pack.add({
  { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  "https://github.com/tami5/sql.nvim",
  "https://github.com/nvim-telescope/telescope-frecency.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/tknightz/telescope-termfinder.nvim",
  "https://github.com/piersolenski/import.nvim",
}, { load = true, confirm = false })

local configure_telescope = function()
  local actions = require("telescope.actions")

  local extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  }

  local defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
        ["<C-h>"] = false,
        ["<C-[>"] = actions.close,
      },
    },
  }

  local telescope = require("telescope")
  local builtin = require("telescope.builtin")

  -- local function custom_find()
  --   require("telescope.builtin").find_files(require("telescope.themes").get_ivy({
  --     -- layout_config = {
  --     --     prompt_position = 'top',
  --     --     preview_width = 0.5,
  --     -- },
  --     find_command = {
  --       "fd",
  --       "--no-ignore-vcs",
  --       "--hidden",
  --       "--ignore-file",
  --       vim.fs.joinpath(vim.env.XDG_CONFIG_HOME, ".ignore"),
  --     },
  --   }))
  -- end

  local function custom_find()
    require("telescope.builtin").find_files({
      initial_mode = "insert",
      -- sorting_strategy = 'ascending',
      -- layout_strategy = 'vertical',
      results_title = false,
      layout_config = {
        width = 0.8,
        height = 0.6,
        prompt_position = "bottom",
        -- mirror = true,
      },
      find_command = {
        "fd",
        "--no-ignore-vcs",
        "--hidden",
        "--ignore-file",
        vim.fs.joinpath(vim.env.XDG_CONFIG_HOME, ".ignore"),
      },
    })
  end

  local function locations()
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local telescope_config = require("telescope.config").values

    return function(opts)
      pickers
          .new(opts, {
            prompt_title = "Locations",
            sorter = telescope_config.generic_sorter(opts),
            finder = finders.new_table({
              results = {
                "~/.config/nvim",
                "~/dotfiles",
                "~/.config/zsh",
                "~/dev/personal/algorithms-and-stuff/coursera/electric_boogalo_algorithms",
                vim.env.ZK_NOTEBOOK_DIR,
              },
            }),
            attach_mappings = function(_, map)
              return true
            end,
          })
          :find(
          )
    end
  end

  telescope.setup({
    defaults = defaults,
    extensions = extensions,
  })

  local status_ok, persisted = pcall(require, "persisted")

  if status_ok then
    telescope.load_extension("persisted")
  end

  require('import').setup()

  telescope.load_extension("fzf")
  telescope.load_extension("import")

  vim.keymap.set("n", "<leader>sf", custom_find)
  vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })

  vim.keymap.set("n", "<leader>sl", locations())
  vim.keymap.set("n", "<leader>sr", builtin.oldfiles)
end

configure_telescope()
