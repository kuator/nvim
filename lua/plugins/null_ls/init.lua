local function config()
  local null_ls_status_ok, null_ls = pcall(require, "null-ls")
  if not null_ls_status_ok then
    return
  end

  ----pyink---
  local h = require("null-ls.helpers")
  local methods = require("null-ls.methods")

  local FORMATTING = methods.internal.FORMATTING
  local RANGE_FORMATTING = methods.internal.RANGE_FORMATTING

  local pyink =  h.make_builtin({
      name = "pyink",
      meta = {
          url = "https://github.com/google/pyink",
          description = "The Google Python code formatter",
      },
      method = { FORMATTING, RANGE_FORMATTING },
      filetypes = { "python" },
      generator_opts = {
          command = "pyink",
          args = function(params)
            if params.method == FORMATTING then
              return {
                "--stdin-filename",
                "$FILENAME",
                "--quiet",
                "-",
              }

            end
            local row, end_row = params.range.row - 1, params.range.end_row - 1
            local col, end_col = params.range.col - 1, params.range.end_col - 1
            local start_offset = vim.api.nvim_buf_get_offset(params.bufnr, row) + col
            local end_offset = vim.api.nvim_buf_get_offset(params.bufnr, end_row) + end_col
            return { "--stdin-filename", "$FILENAME", "--quiet", "-", }
        end,

          to_stdin = true,
      },
      factory = h.formatter_factory,
  })
  ----pyink---

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
      -- formatting.autopep8,
      -- formatting.yapf,
      formatting.pyink,
      -- darker
    },
  })

  
end

return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = 'plenary.nvim',
  config = config,
}
