local capabilities = require('plugins.lsp-plugins.lsp.handlers').capabilities

local config = {
    cmd = { vim.fs.normalize('~/.local/share/nvim/mason/bin/jdtls') },
    root_dir = vim.fs.dirname(vim.fs.find({'.gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    capabilities = capabilities
}

require('jdtls').start_or_attach(config)
