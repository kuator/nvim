return {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    config = function()
      require("mason").setup()
    end,
    commit='0f1cb65f436b769733d18b41572f617a1fb41f62',
    lazy = true
}
