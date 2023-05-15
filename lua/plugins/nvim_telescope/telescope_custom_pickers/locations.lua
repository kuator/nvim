local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local telescope_config = require("telescope.config").values

return function(opts)
  print(opts)
  pickers.new(opts, {
    prompt_title = "Locations",
    sorter = telescope_config.generic_sorter(opts),
    finder = finders.new_table {
      results = {
        "~/.config/nvim",
        "~/dotfiles",
        "~/.config/zsh",
        "~/dev/payda/paydabackend",
      },
    },
    attach_mappings = function(_, map)
      return true
    end
  }):find()
end
