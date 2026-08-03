if vim.g.vscode then
  return
end

local packages = { "gitsigns.nvim", "satellite.nvim" }

vim.pack.add({
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/lewis6991/satellite.nvim",
}, { load = false, confirm = false })

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  once = true,
  callback = function()
    require("config.lazy").load(packages)
    require("gitsigns.actions").toggle_current_line_blame(true)
  end,
})
