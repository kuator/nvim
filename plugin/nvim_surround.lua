vim.pack.add({ "https://github.com/kylechui/nvim-surround" }, { load = true, confirm = false })

require("nvim-surround").setup({
  surrounds = {
    q = { add = { '"', '"' } },
    ['.'] = { add = { '<', '>' } },
    c = {
      add = { "{", "}" },
      find = function()
        local config = require("nvim-surround.config")
        return config.get_selection({ motion = "a}" })
      end,
      delete = "^(.)().-(.)()$",
    }
  }
})
