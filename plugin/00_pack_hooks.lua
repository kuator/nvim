local build_commands = {
  ["telescope-fzf-native.nvim"] = { "make" },
  LuaSnip = { "make", "install_jsregexp" },
}

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local command = build_commands[ev.data.spec.name]
    if command and (ev.data.kind == "install" or ev.data.kind == "update") then
      vim.system(command, { cwd = ev.data.path }):wait()
    end
  end,
})
