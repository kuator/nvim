return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    opt = true,
    config = function()
      local luasnip = require 'luasnip'
      local cmp = require 'cmp'
      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<C-k>'] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
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
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'skkeleton' },
          },
        view = {
          entries = 'native'
        }
      }
      end,
      wants = { "LuaSnip", "skkeleton" },
      requires = {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        {
          "L3MON4D3/LuaSnip",
          wants = "friendly-snippets",
          },
        "rafamadriz/friendly-snippets",
        {
            'vim-skk/skkeleton',
            -- keys = { { 'i'; '<c-j>' } };
            event = 'InsertEnter',
            requires ='vim-denops/denops.vim',
            wants = {'denops.vim', 'cmp-skkeleton'},
            config = function ()
              vim.cmd[[imap <silent> <c-g> <Plug>(skkeleton-toggle)]]
            end
        },
        'rinx/cmp-skkeleton',
    },
  }
