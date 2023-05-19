local function config()
  local luasnip = require 'luasnip'
  local cmp = require 'cmp'

  local mappings = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    -- ['<CR>'] = cmp.mapping.confirm {
    --   behavior = cmp.ConfirmBehavior.Replace,
    --   select = true,
    -- },
    ['<C-k>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-j>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-l>'] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable(1) then
        luasnip.expand_or_jump(1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }

  cmp.setup {
    preselect = cmp.PreselectMode.None,
    confirmation = {
      default_behavior = cmp.ConfirmBehavior.Replace,
    },
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert(mappings),
    enabled = function()
      local disabled = false
      disabled = disabled or vim.fn.getcmdwintype() ~= ''
      disabled = disabled or vim.bo.buftype == 'prompt'
      return not disabled
    end,
    sources = {
      { name = "nvim_lsp", max_item_count = 20, priority_weight = 100},
      { name = 'luasnip', priority_weight = 120 },
      { name = "buffer", max_item_count = 5, priority_weight = 80},
      { name = "path", max_item_count = 5, priority_weight = 100},
      { name = 'skkeleton'},
    },
    view = {
      entries = 'native'
    }
  }
end

return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    opt = true,
    config = config,
    dependencies = {
      "LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
    },
  },
}
