local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local telescope_config = require("telescope.config").values

local extensions = {
  fzf = {
    fuzzy = true,                    -- false will only do exact matching
    override_generic_sorter = true, -- override the generic sorter
    override_file_sorter = true,     -- override the file sorter
    case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    -- the default case_mode is "smart_case"
  }
}

local defaults = {
  mappings = {
    i = {
      ["<C-u>"] = false,
      ["<C-d>"] = false,
      ["<C-h>"] = false,
    },
  },
}

require('telescope').setup {
  defaults = defaults,
  extensions = extensions
}

require('telescope.builtin').locations = require('plugins.nvim-telescope.telescope-custom-pickers.locations')
require('telescope').load_extension('fzf')
require('telescope').load_extension('frecency')
require("telescope").load_extension "file_browser"

vim.keymap.set('n', '<leader>sf', require('plugins.nvim-telescope.telescope-custom-pickers.custom-find'))
vim.keymap.set('n', '<leader>st', require('plugins.nvim-telescope.telescope-custom-pickers.terminals'))
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').grep_string)
vim.keymap.set('n', '<leader>so', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').oldfiles)
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>sl', require('telescope.builtin').locations)
vim.keymap.set('n', '<leader><leader>', require('telescope').extensions.frecency.frecency)
vim.keymap.set("n", "<leader>se", require "telescope".extensions.file_browser.file_browser)
