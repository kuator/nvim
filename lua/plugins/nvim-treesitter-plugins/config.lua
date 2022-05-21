-- plugins/nvim-treesitter-plugins.

local folderOfThisFile = (...):match("(.-)[^%.]+$")

local modules = require(folderOfThisFile .. 'modules')

local config = {
  ensure_installed = { "python", "lua"},
  highlight = { enable = true },
}

for i,v in pairs(modules) do
  config = vim.tbl_deep_extend("force", config, require(folderOfThisFile .. "modules-configs." .. v))
end

require'nvim-treesitter.configs'.setup(config)
