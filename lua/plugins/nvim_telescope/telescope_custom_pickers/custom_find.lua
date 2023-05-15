return function()
  require'telescope.builtin'.find_files(
    require('telescope.themes').get_dropdown({
      find_command = {
        "fd",
        "--no-ignore-vcs",
        "--hidden",
        "--ignore-file",
        vim.fn.expand("~/.config/.ignore")
      }
    }
    )
  )
end
