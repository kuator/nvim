-- plugins/nvim-treesitter-plugins.
local folderOfThisFile = (...):match("(.-)[^%.]+$")

local modules = require(folderOfThisFile .. 'modules')

local config = {
  ensure_installed = { "python", "lua", "bash", "cpp"},
  highlight = { enable = true },
}

for i, v in pairs(modules) do
  config = vim.tbl_deep_extend("force", config, require(folderOfThisFile .. "modules-configs." .. i))
end

require'nvim-treesitter.configs'.setup(config)
