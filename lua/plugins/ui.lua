return {
  require('plugins.lualine.init'),
  -- 'sindrets/diffview.nvim',
  {
    "b0o/incline.nvim",
    config = function ()
      require('incline').setup({
        render = function(props)
          local bufname = vim.api.nvim_buf_get_name(props.buf)
          if bufname == "" then
            return "[No name]"
          else
            return vim.fn.fnamemodify(bufname, ":.")
          end
        end,
      })
    end
  },
  require('plugins.alpha'),
  {
    'lukas-reineke/indent-blankline.nvim',
    opt = true,
    event = "BufReadPre",
    config = function ()
      vim.opt.list = true
      vim.opt.listchars:append("eol:↴")
      -- vim.opt.listchars:append("space:⋅")

      require("indent_blankline").setup {
        -- space_char_blankline = " ",
        -- show_current_context = true,
        -- show_current_context_start = true,
      }
    end
  }
}
