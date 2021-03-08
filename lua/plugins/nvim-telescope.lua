return function()
  ------------------------------
  require('telescope').setup{
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
  end
