require("config.lazy").load({
  "telescope-fzf-native.nvim",
  "sql.nvim",
  "telescope-frecency.nvim",
  "telescope.nvim",
  "telescope-termfinder.nvim",
}, "config.telescope")

require("zk").setup({ picker = "telescope" })
