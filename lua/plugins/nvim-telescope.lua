return function()
  ------------------------------
  require('telescope').setup{
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        }
    },
    defaults = {
      mappings = {
        i = {
          ["<c-d>"] = false,
          ["<c-u>"] = false,
        },
      }
    }
  }
  vim.api.nvim_set_keymap('n', '<space>tf', "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>", { noremap = true, silent = true })
  require('telescope').load_extension('fzy_native')
end
