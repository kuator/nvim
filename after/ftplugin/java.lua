local status_ok, jdtls = pcall(require, "jdtls")

if not status_ok then
  return
end

local capabilities = require('plugins.lsp-plugins.lsp.handlers').capabilities

local config = {
    cmd = { vim.fn.stdpath("data") .. '/mason/bin/jdtls' },
    root_dir = vim.fs.dirname(vim.fs.find({'.gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    capabilities = capabilities,
    settings = {
      java = {
        completion = {
          overwrite = true
        }
      }
    }
}


jdtls.start_or_attach(config)
