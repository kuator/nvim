local function config()
  local luasnip = require("luasnip")
  local cmp = require("cmp")

  local mappings = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    -- ['<CR>'] = cmp.mapping.confirm {
    --   behavior = cmp.ConfirmBehavior.Replace,
    --   select = true,
    -- },
    ["<C-k>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-j>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-l>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable(1) then
        luasnip.expand_or_jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }

  local cmp_config = {
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
      disabled = disabled or vim.fn.getcmdwintype() ~= ""
      disabled = disabled or vim.bo.buftype == "prompt"
      return not disabled
    end,
    sources = {
      { name = "nvim_lsp", max_item_count = 20,  priority_weight = 100 },
      { name = "luasnip",  priority_weight = 120 },
      { name = "buffer",   max_item_count = 2,   priority_weight = 80 },
      {
        name = "rg",
        max_item_count = 8,
        priority_weight = 80,
        option = { additional_arguments = "--smart-case" },
      },
      { name = "path",     max_item_count = 2, priority_weight = 100 },
      { name = "skkeleton" },
    },
    view = {
      entries = "native",
    },
  }

  local has_handlers, handlers = pcall(require, "nvim-autopairs.completion.handlers")

  local has_autopairs, npairs = pcall(require, "nvim-autopairs")

  local _, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")

  -- local function on_confirm_done(evt)
  --   local callback = cmp_autopairs.on_confirm_done({
  --     filetypes = {
  --       ["cs"] = {
  --         ["("] = {
  --           kind = {
  --             cmp.lsp.CompletionItemKind.Function,
  --             cmp.lsp.CompletionItemKind.Method,
  --             cmp.lsp.CompletionItemKind.Class,
  --           },
  --           handler = function(char, item, bufnr, rules, _)
  --             handlers["*"](char, item, bufnr, rules)
  --           end,
  --         },
  --       },
  --       ["python"] = {
  --         ["("] = {
  --           kind = {
  --             cmp.lsp.CompletionItemKind.Class,
  --           },
  --           handler = function(char, item, bufnr, rules, _)
  --             if item.data then
  --               item.data.funcParensDisabled = falsecmpfriini
  --             end
  --             handlers["*"](char, item, bufnr, rules)
  --           end,
  --         },
  --       },
  --     },
  --   })
  --
  --   local function custom_confirm()
  --     require('nvim-autopairs').enable()
  --     local result = callback(evt)
  --     vim.defer_fn(function() require('nvim-autopairs').disable() end, 200)
  --     return result
  --   end
  --
  --   return custom_confirm()
  -- end

  local function on_confirm_done(evt)
    local entry = evt.entry
    local item = entry:get_completion_item()
    local types = require("cmp.types")

    if evt.commit_character then
      return
    end

    print('--------------')
    print(entry:get_kind())
    print(item.type)
    print(item.label)
    print(vim.bo.filetype)
    print(entry:get_kind() == types.lsp.CompletionItemKind.Class)
    print('--------------')

    if item.label:find('<>') and vim.bo.filetype == "cs" and entry:get_kind() == types.lsp.CompletionItemKind.Class then
      local ls = require('luasnip')
      ls.snip_expand(ls.s("trig", { ls.t"<", ls.i(1, "Template"), ls.t">" }) )
      return
    end

    if item.label:find('<%a+>') and vim.bo.filetype == "java" and entry:get_kind() == types.lsp.CompletionItemKind.Class then
      local ls = require('luasnip')
      ls.snip_expand(ls.s("trig", { ls.t"<", ls.i(1, "Template"), ls.t">" }) )
      return
    end

    if
        vim.bo.filetype == "cs"
        and (
          entry:get_kind() == types.lsp.CompletionItemKind.Function
          or entry:get_kind() == types.lsp.CompletionItemKind.Method
          or entry:get_kind() == types.lsp.CompletionItemKind.Class
        )
    then
      local ls = require('luasnip')
      ls.snip_expand(ls.s("trig", { ls.t"(", ls.i(1, ""), ls.t")" }) )

      return
    end

  end

  if has_autopairs then
    npairs.setup({})

    require "nvim-autopairs".disable()

    cmp.event:on(
      "confirm_done",
      on_confirm_done
    )
  end

  -- https://github.com/axelvc/dots/blob/10fc0493ac90c9c8515800a3128038f049dfcde0/nvim/lua/plugins/lsp/servers/emmet.lua#L29
  local cmp_kinds = require("cmp.types").lsp.CompletionItemKind
  local is_emmet_snippet = function(entry)
    return cmp_kinds[entry:get_kind()] == "Text" and entry.source:get_debug_name() == "nvim_lsp:emmet_language_server"
  end

  local emmet_in_jsx_only = function(entry, _)
    -- print(is_emmet_snippet(entry))
    if is_emmet_snippet(entry) then
      local node = vim.treesitter.get_node()
      return node and node:type() == "jsx_element" or false
    end
    return true
  end

  local JS_CONFIG = {
    sources = cmp.config.sources({
      { name = "nvim_lsp",               entry_filter = emmet_in_jsx_only },
      { name = "luasnip",                priority_weight = 120 },
      { name = "nvim_lsp_signature_help" },
    }, {
      { name = "treesitter" },
      { name = "path" },
      { name = "buffer",    keyword_length = 3 },
    }, {
      { name = "calc" },
      { name = "emoji" },
    }),
  }

  cmp.setup.filetype("javascript", JS_CONFIG)
  cmp.setup.filetype("javascriptreact", JS_CONFIG)

  cmp.setup.filetype("typescript", JS_CONFIG)
  cmp.setup.filetype("typescriptreact", JS_CONFIG)

  local ok, lspkind = pcall(require, "lspkind")

  if ok then
    cmp_config["formatting"] = {
      format = lspkind.cmp_format({
        mode = "symbol",       -- show only symbol annotations
        maxwidth = 50,         -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        before = function(entry, vim_item)
          -- Get the full snippet (and only keep first line)
          local types = require("cmp.types")

          -- csharp class parentheses completion
          if not has_autopairs then
            return vim_item
          end

          -- print(has_autopairs)

          local item = entry:get_completion_item()

          print(entry:get_kind() .. " " .. entry:get_insert_text() .. " " .. item.label)

          if not has_autopairs then
            return vim_item
          end

          

          if
              vim.bo.filetype == "cs"
              and (
                entry:get_kind() == types.lsp.CompletionItemKind.Function
                or entry:get_kind() == types.lsp.CompletionItemKind.Method
                or entry:get_kind() == types.lsp.CompletionItemKind.Class
              )
          then
            local word = entry:get_insert_text()
            vim_item.abbr = word .. "~"
          end

          if item.label:find('<>') and vim.bo.filetype == "cs" and entry:get_kind() == types.lsp.CompletionItemKind.Class then
            local word = entry:get_insert_text()
            vim_item.abbr = word .. '<>'.. "~"
          end


          -- python class parentheses completion
          if vim.bo.filetype == "python" and entry:get_kind() == types.lsp.CompletionItemKind.Class then
            local word = entry:get_insert_text()
            vim_item.abbr = word .. "~"
          end


          return vim_item
        end,
      }),
    }
  end

  -- print(vim.inspect(cmp_config))

  cmp.setup(cmp_config)
end

return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = config,
    dependencies = {
      "LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "lukas-reineke/cmp-rg",
      "onsails/lspkind.nvim",
      "windwp/nvim-autopairs",
      -- {
      --   'windwp/nvim-ts-autotag',
      --   config = function ()
      --      require('nvim-ts-autotag').setup()
      --   end
      -- }
    },
  },
}
