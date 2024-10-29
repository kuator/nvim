return {
  "L3MON4D3/LuaSnip",
  -- dependencies = "rafamadriz/friendly-snippets",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "ults-io/vscode-react-javascript-snippets",
    "filwaline/vscode-postfix-python",
  },
  build = "make install_jsregexp",
  lazy = true,
  config = function()
    local luasnip = require 'luasnip'
    local node_util = require("luasnip.nodes.util")
    -- https://github.com/L3MON4D3/LuaSnip/wiki/Nice-Configs#imitate-vscodes-behaviour-for-nested-placeholders

    luasnip.config.setup({
      parser_nested_assembler = function(_, snippetNode)
        function snippetNode:init_dry_run_active(dry_run)
          if dry_run and dry_run.active[self] == nil then
            dry_run.active[self] = self.active
          end
        end

        function snippetNode:is_active(dry_run)
          return (not dry_run and self.active)
              or (dry_run and dry_run.active[self])
        end

        local original_extmarks_valid = snippetNode.extmarks_valid

        function snippetNode:extmarks_valid()
          -- the contents of this snippetNode are supposed to be deleted, and
          -- we don't want the snippet to be considered invalid because of
          -- that -> always return true.
          return true
        end

        local select = function(snip, no_move, dry_run)
          if dry_run then
            return
          end
          snip:focus()
          -- make sure the inner nodes will all shift to one side when the
          -- entire text is replaced.
          snip:subtree_set_rgrav(true)
          -- fix own extmark-gravities, subtree_set_rgrav affects them as well.
          snip.mark:set_rgravs(false, true)

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

        function snippetNode:jump_into(dir, no_move, dry_run)
          self:init_dry_run_active(dry_run)
          if self:is_active(dry_run) then
            -- inside snippet, but not selected.
            if dir == 1 then
              self:input_leave(no_move, dry_run)
              return self.next:jump_into(dir, no_move, dry_run)
            else
              select(self, no_move, dry_run)
              return self
            end
          else
            -- jumping in from outside snippet.
            self:input_enter(no_move, dry_run)
            if dir == 1 then
              select(self, no_move, dry_run)
              return self
            else
              return self.inner_last:jump_into(dir, no_move, dry_run)
            end
          end
        end

        -- this is called only if the snippet is currently selected.
        function snippetNode:jump_from(dir, no_move, dry_run)
          if dir == 1 then
            if original_extmarks_valid(snippetNode) then
              return self.inner_first:jump_into(dir, no_move, dry_run)
            else
              return self.next:jump_into(dir, no_move, dry_run)
            end
          else
            self:input_leave(no_move, dry_run)
            return self.prev:jump_into(dir, no_move, dry_run)
          end
        end

        return snippetNode
      end
    })
    -- require("luasnip").config.setup({ store_selection_keys = "<c-k>" })

    require('luasnip').filetype_extend('java', { "javadoc" })
    require('luasnip').filetype_extend('python', { 'django', 'django-rest', 'pydoc' })

    -- require("luasnip.loaders.from_vscode").lazy_load({ paths = './snippets/vscode' })

    vim.tbl_map(
      function(type) require("luasnip.loaders.from_" .. type).lazy_load() end,
      { "lua", "snipmate", "vscode" }
    )
    
    -- require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. '/snippets/vscode' } })
    -- require("luasnip.loaders.from_lua").lazy_load({ paths = { vim.fn.stdpath("config") .. '/snippets/luasnip' } })

    require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fs.joinpath(vim.fn.stdpath("config") , 'snippets/vscode' )}})
    require("luasnip.loaders.from_lua").lazy_load({ paths = { vim.fs.joinpath(vim.fn.stdpath("config") , 'snippets/luasnip' )} })
    require("luasnip.loaders.from_snipmate").lazy_load({ paths = { vim.fs.joinpath(vim.fn.stdpath("config") , 'snippets/snipmate' )} })

  end
}
