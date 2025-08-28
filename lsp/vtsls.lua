local vue_language_server_path = vim.fn.expand("$MASON/packages")
    .. "/vue-language-server"
    .. "/node_modules/@vue/language-server"

local vue_plugin = {
  name = "@vue/typescript-plugin",
  location = vue_language_server_path,
  languages = { "vue" },
  configNamespace = "typescript",
}

local vtsls_config = {
  cmd = { "vtsls", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue",
  },
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
        },
      },
    },
    typescript = {
      format = {
        enable = false,
      },
      suggest = {
        completeFunctionCalls = true,
      },
    },
    javascript = {
      format = {
        enable = false,
      },
      suggest = {
        completeFunctionCalls = true,
      },
    },
  },
}

vim.lsp.config('vtsls', vtsls_config)
