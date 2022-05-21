local M = {}
local modules = {
  ["nvim-treesitter/nvim-treesitter-textobjects"] = "textobjects" 
}

local config = {
  ensure_installed = { "python", "lua"},
  highlight = { enable = true },
}

-- plugins/nvim-treesitter-plugins.
local folderOfThisFile = (...):match("(.-)[^%.]+$")

local plugins = {}

for i,v in pairs(modules) do
  table.insert(plugins, i)
  config = vim.tbl_deep_extend("force", config, require(folderOfThisFile .. "modules." .. v))
end

local configure = function()
    require'nvim-treesitter.configs'.setup(config)
end

local treesitter = {
  'nvim-treesitter/nvim-treesitter',
  -- config = configure
}

table.insert(plugins, treesitter)

M.plugins = plugins
M.configure = configure
return M
