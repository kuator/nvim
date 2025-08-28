local emmylua_ls = {
  cmd = { "emmylua_ls" },
  settings = {
    Lua = {
      diagnostics = {
        disable = {
          "unnecessary-if", -- buggy rule
        },
      },
      completion = {
        enable = true,
        -- callSnippet = true,
        callSnippet = 'Replace',
      },
      signature = {
        detailSignatureHelper = true,
      },
      strict = {
        requirePath = true,
        typeCall = true,
      },
    },
  },
}

vim.lsp.config('emmylua_ls', emmylua_ls)
