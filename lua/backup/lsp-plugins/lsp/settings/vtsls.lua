require("lspconfig.configs").vtsls = require("vtsls").lspconfig -- set default server config
return {
  settings = {
    typescript = {
      format = {
        enable = false
      },
      suggest = {
        completeFunctionCalls = true,
      },
    },
    javascript = {
      format = {
        enable = false
      },
      suggest = {
        completeFunctionCalls = true,
      },
    }
  }
}
