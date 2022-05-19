return function()
  local servers = { "pylance", "sumneko_lua", "tsserver" }
  local ensure_installed = vim.tbl_filter(function (d) return d ~= "pylance" end, servers)

  local lsp_installer = require("nvim-lsp-installer")

  lsp_installer.setup {
    ensure_installed = ensure_installed
  }

  local lspconfig = require("lspconfig")

  for _, server in pairs(servers) do
    local opts = {
      on_attach = require("plugins.lsp.handlers").on_attach,
      capabilities = require("plugins.lsp.handlers").capabilities,
    }
    local has_custom_opts, server_custom_opts = pcall(require, "plugins.lsp.settings." .. server)
    if has_custom_opts then
      opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
    end
    lspconfig[server].setup(opts)
  end

end
