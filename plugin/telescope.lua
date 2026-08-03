local packages = {
  "telescope-fzf-native.nvim",
  "sql.nvim",
  "telescope-frecency.nvim",
  "telescope.nvim",
  "telescope-termfinder.nvim",
}

vim.pack.add({
  { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
  "https://github.com/tami5/sql.nvim",
  "https://github.com/nvim-telescope/telescope-frecency.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/tknightz/telescope-termfinder.nvim",
}, { load = false, confirm = false })

local function telescope()
  return require("config.lazy").load(packages, "config.telescope")
end

require("config.lazy").commands("Telescope", packages, "config.telescope")


vim.keymap.set("n", "<leader>sf", function()
  telescope().custom_find()
end)
vim.keymap.set("n", "<leader>ff", function()
  telescope().find_files()
end, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>sl", function()
  telescope().locations({})
end)
vim.keymap.set("n", "<leader>sr", function()
  telescope().oldfiles()
end)
