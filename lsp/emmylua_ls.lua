local emmylua_ls = {
  cmd = { "emmylua_ls" },
  settings = {
    emmylua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        disable = {
          "unnecessary-if", -- buggy rule
        },
        globals = { "vim" },
      },
      completion = {
        enable = true,
        callSnippet = true,
      },
      signature = {
        detailSignatureHelper = true,
      },
      strict = {
        requirePath = true,
        typeCall = true,
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("lua", true),
      },
    },
  },
}

-- vim.lsp.config('emmylua_ls', emmylua_ls)
return emmylua_ls
