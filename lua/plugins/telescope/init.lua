return {
  { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', opt = true },
  { 'tami5/sql.nvim', opt = true },
  {
      "nvim-telescope/telescope-frecency.nvim",
      opt = true,
      wants = { "sql.nvim" }
    },
  {
      'nvim-telescope/telescope.nvim',
      wants = {
        'plenary.nvim',
        'telescope-fzf-native.nvim',
        'telescope-frecency.nvim',
      },
      opt=true,
      keys = {
        {'n'; '<leader>sf'};
        {'n'; '<leader>sb'};
        {'n'; '<leader>sg'};
        {'n'; '<leader>st'};
        {'n'; '<leader>sp'};
      };
      cmd = {
        'Telescope'
      };

      config=function()
        require('telescope').setup {
          defaults = {
            mappings = {
              i = {
                ["<C-u>"] = false,
                ["<C-d>"] = false
              },
            },
          },
          extensions = {
            fzf = {
              fuzzy = true,                    -- false will only do exact matching
              override_generic_sorter = true, -- override the generic sorter
              override_file_sorter = true,     -- override the file sorter
              case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
              -- the default case_mode is "smart_case"
            }
          }
        }

        local function custom_find()
          require'telescope.builtin'.find_files(
            require('telescope.themes').get_dropdown({
                find_command = {
                  "fdfind",
                  "--no-ignore-vcs",
                  "--hidden",
                  "--ignore-file",
                  vim.fn.expand("~/.config/.ignore")
                }
              }
            )
          )
        end

        vim.keymap.set('n', '<leader>sf', custom_find, { silent = true })
        vim.keymap.set('n', '<leader>sd', require('telescope.builtin').grep_string)
        vim.keymap.set('n', '<leader>sp', require('telescope.builtin').live_grep)
        vim.keymap.set('n', '<leader>sb', require('telescope.builtin').current_buffer_fuzzy_find)
      end;
  }
}
