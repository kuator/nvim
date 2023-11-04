return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}, -- this is equalent to setup({}) function
    config = function ()
      -- Import nvim-autopairs safely
      local autopairs_setup, autopairs = pcall(require, "nvim-autopairs")
      if not autopairs_setup then
        return
      end

      -- Configure autopairs
      autopairs.setup({
        check_ts = true, -- Enable treesitter
        ts_config = {
          lua = { "string" }, -- Don't add pairs in lua string treesitter nodes
          javascript = { "template_string" }, -- Don't add pairs in JavaScript template_string treesitter nodes
          java = false, -- Don't check treesitter on Java
        },
      })

      -- Import nvim-autopairs completion functionality safely
      local cmp_autopairs_setup, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
      if not cmp_autopairs_setup then
        return
      end

      -- Import nvim-cmp plugin safely (completions plugin)
      local cmp_setup, cmp = pcall(require, "cmp")
      if not cmp_setup then
        return
      end

      -- Make autopairs and completion work together
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
}
