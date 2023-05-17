local function config()
  local null_ls_status_ok, null_ls = pcall(require, "null-ls")
  if not null_ls_status_ok then
    return
  end

  ----darker---
  local h = require("null-ls.helpers")
  local methods = require("null-ls.methods")

  local FORMATTING       = methods.internal.FORMATTING
  local RANGE_FORMATTING = methods.internal.RANGE_FORMATTING

  local darker = h.make_builtin({
    name = "darker",
    meta = {
      url = "https://github.com/akaihola/darker",
      description = "For when you want to use black but really can't",
    },
    method = {FORMATTING, RANGE_FORMATTING},
    filetypes = { "python" },
    generator_opts = {
      args = {
        "--stdout",
        "--quiet",
        "$FILENAME",
      },
      command = "darker",
    },
    factory = h.formatter_factory,
  })
  ----darker---

  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
  local formatting = null_ls.builtins.formatting
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup({
    debug = true,
    debounce = 1000,
    sources = {
      formatting.stylua.with({ extra_args = { "--indent_type", "Spaces", "indent_width", "2" } }),
      -- diagnostics.flake8,
      diagnostics.ruff,
      formatting.autopep8,
      -- darker
    },
  })

  
end

return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = 'plenary.nvim',
  config = config,
}
