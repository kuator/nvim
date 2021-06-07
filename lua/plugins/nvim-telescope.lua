return function()
  require('telescope').setup{
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        }
    },
    defaults = {
      -- file_ignore_patterns = {"node_modules", "env"},
      mappings = {
        i = {
          ["<c-d>"] = false,
          ["<c-u>"] = false,
          ["<c-h>"] = false,
        },
      }
    }
  }
  vim.api.nvim_set_keymap('n', '<space>tf', [[<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({find_command = {"fd", "--no-ignore-vcs", "--hidden", "--ignore-file", vim.fn.expand("~/.config/.ignore")}}))<cr>]], { noremap = true, silent = true })
  -- {"rg", "--files","--smart-case", "--no-ignore-vcs","--hidden" ,"--ignore-file", "~/.config/.ignore" }
  
  require('telescope').load_extension('fzy_native')
end
