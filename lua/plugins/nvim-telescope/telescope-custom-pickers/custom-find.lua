local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local telescope_config = require("telescope.config").values

return function()
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
