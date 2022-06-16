local get_file_folder = require('utils')
local relativePathOfThisFile = ...
local filePath = debug.getinfo(1, 'S').source;

local folderOfThisFile = get_file_folder(filePath, relativePathOfThisFile)

local modules = require(folderOfThisFile .. 'modules')

local plugins = {}

for _, v in pairs(modules) do
  table.insert(plugins, v)
end


local treesitter = {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require 'plugins.nvim-treesitter-plugins.config'
  end
}

local tmp = {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require 'plugins.nvim-treesitter-plugins.config'
    end
  },
  -- {
  --   'ziontee113/syntax-tree-surfer',
  --   config = function()
  --     -- vim.keymap.set("n", "vd", function()
  --     --   vim.opt.opfunc = "v:lua.STSSwapCurrentNodeNextNormal_Dot"
  --     --   return "g@l"
  --     -- end, { silent = true, expr = true })
  --     -- vim.keymap.set("n", "vu", function()
  --     --   vim.opt.opfunc = "v:lua.STSSwapCurrentNodePrevNormal_Dot"
  --     --   return "g@l"
  --     -- end, { silent = true, expr = true })

  --     local opts = {noremap = true, silent = true}

  --     vim.keymap.set("n", "vd", '<cmd>STSSwapCurrentNodeNextNormal<cr>', opts)
  --     vim.keymap.set("n", "vu", '<cmd>STSSwapCurrentNodePrevNormal<cr>', opts)
  --     vim.keymap.set("n", "vD", '<cmd>STSSwapDownNormal<cr>', opts)
  --     vim.keymap.set("n", "vU", '<cmd>STSSwapUpNormal<cr>', opts)
  --   end
  -- }
}

for _, v in pairs(tmp) do
  table.insert(plugins, v)
end

return plugins
