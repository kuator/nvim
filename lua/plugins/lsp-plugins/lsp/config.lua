local servers = {
  "pylance",
  "lua_ls",
  -- "tsserver",
  "emmet_ls",
  "bashls",
  "html",
  "cssls",
  "awk_ls",
  "clangd",
  "gopls",
  "vtsls",
}

local ensure_installed = vim.tbl_filter(function(d) return d ~= "pylance" end, servers)

local masonlspconfig_status_ok, lsp_installer = pcall(require, "mason-lspconfig")
local mason_status_ok, mason = pcall(require, "mason")

if masonlspconfig_status_ok then
  if mason_status_ok then
    require("mason").setup()
    lsp_installer.setup { ensure_installed = ensure_installed }
  end
end

-- https://stackoverflow.com/questions/9145432/load-lua-files-by-relative-path
-- "plugins.lsp-plugins.lsp"
local folderOfThisFile = (...):match("(.-)[^%.]+$") -- returns 'lib.foo.'

local lspconfig = require("lspconfig")

for _, server in pairs(servers) do
  local handlers = require(folderOfThisFile .. "handlers")
  local opts = {
    -- on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
  }
  local has_custom_opts, server_custom_opts = pcall(require, folderOfThisFile .. "settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
  end
  lspconfig[server].setup(opts)
end
