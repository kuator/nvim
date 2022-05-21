-- local modules = {
--   ["nvim-treesitter/nvim-treesitter-textobjects"] = "textobjects"
-- }


-- -- plugins/nvim-treesitter-plugins.
-- local folderOfThisFile = (...):match("(.-)[^%.]+$")

-- print(folderOfThisFile)

-- local plugins = {}

-- local config = {
--   ensure_installed = { "python", "lua"},
--   highlight = { enable = false },
-- }

-- for i,v in pairs(modules) do
--   -- vim.tbl_deep_extend("force", config, require(folderOfThisFile .. "modules." .. v))
--   -- table.insert(plugins, i)
-- end

-- local treesitter = {
--   'nvim-treesitter/nvim-treesitter',
--   -- opt = true,
--   config = function()
--     require'nvim-treesitter.configs'.setup(config)
--   end
-- }

-- table.insert(plugins, treesitter)

-- return plugins

return require'plugins.nvim-treesitter-plugins.treesitter'
