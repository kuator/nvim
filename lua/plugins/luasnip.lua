return {
  "L3MON4D3/LuaSnip",
  dependencies = "rafamadriz/friendly-snippets",
  lazy = true,
  config = function()
    local luasnip = require 'luasnip'
    local node_util = require("luasnip.nodes.util")
    -- https://github.com/L3MON4D3/LuaSnip/wiki/Nice-Configs#imitate-vscodes-behaviour-for-nested-placeholders
    luasnip.config.setup {
      parser_nested_assembler = function(_, snippet)
        local select = function(snip, no_move)
          snip.parent:enter_node(snip.indx)
          -- upon deletion, extmarks of inner nodes should shift to end of
          -- placeholder-text.
          for _, node in ipairs(snip.nodes) do
            node:set_mark_rgrav(true, true)
          end

          -- SELECT all text inside the snippet.
          if not no_move then
            vim.api.nvim_feedkeys(
              vim.api.nvim_replace_termcodes("<Esc>", true, false, true),
              "n",
              true
            )
            node_util.select_node(snip)
          end
        end
        function snippet:jump_into(dir, no_move)
          if self.active then
            -- inside snippet, but not selected.
            if dir == 1 then
              self:input_leave()
              return self.next:jump_into(dir, no_move)
            else
              select(self, no_move)
              return self
            end
          else
            -- jumping in from outside snippet.
            self:input_enter()
            if dir == 1 then
              select(self, no_move)
              return self
            else
              return self.inner_last:jump_into(dir, no_move)
            end
          end
        end

        -- this is called only if the snippet is currently selected.
        function snippet:jump_from(dir, no_move)
          if dir == 1 then
            return self.inner_first:jump_into(dir, no_move)
          else
            self:input_leave()
            return self.prev:jump_into(dir, no_move)
          end
        end

        return snippet
      end
    }

    require("luasnip").config.setup({store_selection_keys="<c-k>"})
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. '/snippets/vscode' } })
    -- require("luasnip.loaders.from_vscode").lazy_load({ paths = './snippets/vscode' })
    require("luasnip.loaders.from_lua").lazy_load({paths = { vim.fn.stdpath("config") .. '/snippets/luasnip' }})
  end
}
