return {
  "mickael-menu/zk-nvim",
  -- lazy = false,
  config = function()
    require("zk").setup({
      picker = "telescope",
    })
  end,
  dependencies = "https://github.com/nvim-telescope/telescope.nvim",
  cmd = { "ZkIndex", "ZkNew", "ZkCd", "ZkNotes", "ZkBacklinks", "ZkLinks", "ZkTags" },
}
