local folderOfThisFile = (...):match("(.-)[^%.]+$")

local modules = require(folderOfThisFile .. 'modules')

local plugins = {}

for i,v in pairs(modules) do
  table.insert(plugins, i)
end

local treesitter = {
  'nvim-treesitter/nvim-treesitter',
  config = function ()
    require 'plugins.nvim-treesitter-plugins.config'
  end
}

table.insert(plugins, treesitter)

return plugins
