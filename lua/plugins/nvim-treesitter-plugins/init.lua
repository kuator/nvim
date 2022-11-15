local get_file_folder = require('utils')
local relativePathOfThisFile = ...
local filePath = debug.getinfo(1, 'S').source;

local folderOfThisFile = get_file_folder(filePath, relativePathOfThisFile)

local modules = require(folderOfThisFile .. 'modules')

local plugins = {}

for _, v in pairs(modules) do
  table.insert(plugins, v)
end


-- local treesitter = {
--   'nvim-treesitter/nvim-treesitter',
--   config = function()
--     require 'plugins.nvim-treesitter-plugins.config'
--   end
-- }


local tmp = {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require 'plugins.nvim-treesitter-plugins.config'
    end
  },
}

-- https://github.com/Wansmer/treesj
-- https://github.com/Wansmer/sibling-swap.nvim

for _, v in pairs(tmp) do
  table.insert(plugins, v)
end

return plugins
