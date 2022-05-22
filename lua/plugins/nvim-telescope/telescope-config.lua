local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local telescope_config = require("telescope.config").values

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

local locations = function(opts)
  pickers.new(opts, {
    prompt_title = "Locations",
    sorter = telescope_config.generic_sorter(opts),
    finder = finders.new_table {
      results = {
        "~/.config/nvim",
        "~/dotfiles",
        "~/.config/zsh",
      },
    },
    attach_mappings = function(_, map)
      return true
    end
  }):find()
end

require('telescope').setup {
  defaults = defaults,
  extensions = extensions
}

require('telescope.builtin').locations = locations
require('telescope').load_extension('fzf')
require('telescope').load_extension('frecency')

vim.keymap.set('n', '<leader>sf', custom_find, { silent = true })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').grep_string)
vim.keymap.set('n', '<leader>sp', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>sl', require('telescope.builtin').locations)
