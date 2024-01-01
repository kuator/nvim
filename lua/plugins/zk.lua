return {
  "mickael-menu/zk-nvim",
  lazy = false,
  config = function()
    require("zk").setup({
      picker = "telescope",
    })
  end,
  keys = {
    { "<leader>nl", [[<Cmd>ZkNotes { match = { vim.fn.input('Search: ') } }<CR>]], mode = "n" },
    { "<leader>nf", [[:'<,'>ZkMatch<CR>]],                                         mode = "x" },
    -- { "<leader>nn", [[<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>]],        mode = "n" },
    -- { "<leader>nf", [[<Cmd>ZkNotes<CR>]],                                          mode = "n" },
    { "<leader>nr", [[<Cmd>ZkRecents<CR>]],                                        mode = "n" },
    { "<leader>nt", [[<Cmd>ZkTags<CR>]],                                           mode = "n" },
  },
  dependencies = "https://github.com/nvim-telescope/telescope.nvim",
  cmd = { "ZkIndex", "ZkNew", "ZkCd", "ZkNotes", "ZkBacklinks", "ZkLinks", "ZkTags" },
}
