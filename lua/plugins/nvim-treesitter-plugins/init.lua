local get_file_folder = require('utils')
local relativePathOfThisFile = ...
local filePath = debug.getinfo(1,'S').source;

local folderOfThisFile = get_file_folder(filePath, relativePathOfThisFile)

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
