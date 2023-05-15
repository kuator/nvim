return {
    'AckslD/nvim-trevJ.lua',
    opt=true,
    config = require("trevj").setup,  -- optional call for configurating non-default filetypes etc

    -- uncomment if you want to lazy load
    module = 'trevj',

    -- an example for configuring a keybind, can also be done by filetype
    setup = function()
      vim.keymap.set('n', '<leader>j', function()
        require('trevj').format_at_cursor()
      end)
    end,
  }
