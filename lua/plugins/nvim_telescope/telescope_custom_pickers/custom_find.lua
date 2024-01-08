return function()
  require'telescope.builtin'.find_files(
    require('telescope.themes').get_dropdown({
      find_command = {
        "fd",
        "--no-ignore-vcs",
        "--hidden",
        "--ignore-file",
        vim.fs.joinpath(vim.env.XDG_CONFIG_HOME, '.ignore')
      }
    }
    )
  )
end
