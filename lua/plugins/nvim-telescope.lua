return function()
  require('telescope').setup{
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        }
    },
    defaults = {
      file_ignore_patterns = {"node_modules", "env"},
      mappings = {
        i = {
          ["<c-d>"] = false,
          ["<c-u>"] = false,
        },
      }
    }
  }
  vim.api.nvim_set_keymap('n', '<space>tf', [[<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}), {find_command = { "rg", "--files","--smart-case", "--no-ignore-vcs", "--ignore-file", "~/.config/.ignore" }})<cr>]], { noremap = true, silent = true })
  require('telescope').load_extension('fzy_native')
end
