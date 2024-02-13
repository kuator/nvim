return {
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', lazy = true },
  { 'nvim-telescope/telescope-file-browser.nvim', lazy = true },
  { 'piersolenski/telescope-import.nvim', lazy = true },
  -- {
  --   'tknightz/telescope-termfinder.nvim',
  --   config = function ()
  --     require('telescope').load_extension("termfinder")
  --   end,
  --   lazy = true,
  -- },
  { 'tami5/sql.nvim', lazy = true },
  {
    "nvim-telescope/telescope-frecency.nvim",
    lazy = true,
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'plenary.nvim',
      'telescope-fzf-native.nvim',
      'telescope-frecency.nvim',
      'telescope-file-browser.nvim',
      -- 'telescope-termfinder.nvim',
    },
    lazy=true,
    keys = {
      {mode='n'; '<leader>se'};
      {mode='n'; '<leader>sf'};
      {mode='n'; '<leader>sg'};
      {mode='n'; '<leader>st'};
      {mode='n'; '<leader>sl'};
      {mode='n'; '<leader>sh'};
      {mode='n'; '<leader>sy'};
      -- {mode='n'; '<leader>sp'};
      -- {mode='n'; '<leader>sb'};
      -- {mode='n'; '<leader><leader>'};
    };
    cmd = {
      'Telescope'
    };

    config=function ()
      local actions = require("telescope.actions")

      local extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        }
      }

      local defaults = {
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
            ["<C-h>"] = false,
            ["<C-[>"] = actions.close
          },
        },
      }

      require('telescope').setup {
        defaults = defaults,
        extensions = extensions
      }

      local status_ok, persisted = pcall(require, "persisted")

      if status_ok then
        require("telescope").load_extension("persisted")
      end

      local function grep_string()
        require('telescope.builtin').grep_string({
          path_display = { 'smart' },
          only_sort_text = true,
          word_match = "-w",
          search = '',
          debounce = 100
        })
      end

      require('telescope.builtin').locations = require('plugins.nvim_telescope.telescope_custom_pickers.locations')
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('frecency')
      require("telescope").load_extension "file_browser"

      require("telescope").load_extension("import")

      vim.keymap.set('n', '<leader>sf', require('plugins.nvim_telescope.telescope_custom_pickers.custom_find'))
      vim.keymap.set('n', '<leader>st', require('plugins.nvim_telescope.telescope_custom_pickers.terminals'))
      -- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').grep_string)
      vim.keymap.set('n', '<leader>sg', grep_string)
      -- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').oldfiles)
      -- vim.keymap.set('n', '<leader>sb', require('telescope.builtin').current_buffer_fuzzy_find)
      vim.keymap.set('n', '<leader>sl', require('telescope.builtin').locations)

      -- vim.keymap.set('n', '<leader>sr', require('telescope').extensions.frecency.frecency)
      vim.keymap.set('n', '<leader>sr', require('telescope.builtin').oldfiles)

      vim.keymap.set("n", "<leader>se", require "telescope".extensions.file_browser.file_browser)

      -- vim.keymap.set('n', '<leader>ss', ':Telescope<space>')

    end
  }
}
