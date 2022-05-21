return {
  { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', opt = true },
  { 'tami5/sql.nvim', opt = true },
  {
      "nvim-telescope/telescope-frecency.nvim",
      opt = true,
      wants = { "sql.nvim" }
    }
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
        {'n'; '<leader>tf'};
        {'n'; '<leader>tb'};
        {'n'; '<leader>tg'};
        {'n'; '<leader>tt'};
        {'n'; '<leader>tp'};
      };
      cmd = {
        'Telescope'
      };
      config=function() 
        require('telescope').setup {
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

        -- vim.cmd [[nnoremap <leader>tf <cmd>Telescope find_files<cr>]]
        vim.api.nvim_set_keymap('n', '<leader>tf', [[<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({find_command = {"fdfind", "--no-ignore-vcs", "--hidden", "--ignore-file", vim.fn.expand("~/.config/.ignore")}}))<cr>]], { noremap = true, silent = true })
        vim.cmd [[nnoremap <leader>tg <cmd>Telescope live_grep<cr>]]
        vim.cmd [[nnoremap <leader>tb <cmd>Telescope buffers<cr>]]
      end;
    }
