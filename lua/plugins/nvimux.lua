return {
  'hkupty/nvimux',
  config = function()
    local nvimux = require('nvimux')
    local mappings = {
      -- Reload global configs
      {{'n', 'v', 'i'},      '<C-r>', '<Cmd>source $MYVIMRC'},

      -- Window management
      {{'n', 'v', 'i', 't'}, '!',  '<Cmd>wincmd T<CR>'},
      {{'n', 'v', 'i', 't'}, '%',  nvimux.commands.vertical_split},
      {{'n', 'v', 'i', 't'}, '\"', nvimux.commands.horizontal_split},
      {{'n', 'v', 'i', 't'}, '-',  nvimux.go_to_last_tab},
      {{'n', 'v', 'i', 't'}, 'q',  nvimux.term.toggle },
      {{'n', 'v', 'i', 't'}, 'w',  '<Cmd>tabs<CR>'},
      {{'n', 'v', 'i', 't'}, 'o',  '<C-w>w'},
      {{'n', 'v', 'i', 't'}, 'n',  'gt'},
      {{'n', 'v', 'i', 't'}, 'p',  'gT'},
      {{'n', 'v', 'i'},      'x',  '<Cmd>bdelete %<CR>'},
      {{'t'},                'x',  function() vim.api.nvim_buf_delete(0, {force = true}) end},
      {{'n', 'v', 'i'},      'X',  '<Cmd>enew \\| bd #<CR>'},

      -- Moving around
      {{'n', 'v', 'i', 't'}, 'h',  '<C-w><C-h>'},
      {{'n', 'v', 'i', 't'}, 'j',  '<C-w><C-j>'},
      {{'n', 'v', 'i', 't'}, 'k',  '<C-w><C-k>'},
      {{'n', 'v', 'i', 't'}, 'l',  '<C-w><C-l>'},

      -- Term facilities
      {{'t'},                ':',  ':', suffix = ''},
      {{'t'},                '[',  '<C-\\><C-n>'},
      {{'t'},                ']',  nvimux.commands.term_paste },
      {{'t', 'n'},           ',',  nvimux.term.rename},

      -- Tab management
      {{'n', 'v', 'i', 't'}, 'c',  nvimux.commands.new_tab},
      {{'n', 'v', 'i', 't'}, '0',  function() nvimux.go_to_tab(10) end},
      {{'n', 'v', 'i', 't'}, '1',  function() nvimux.go_to_tab(1) end},
      {{'n', 'v', 'i', 't'}, '2',  function() nvimux.go_to_tab(2) end},
      {{'n', 'v', 'i', 't'}, '3',  function() nvimux.go_to_tab(3) end},
      {{'n', 'v', 'i', 't'}, '4',  function() nvimux.go_to_tab(4) end},
      {{'n', 'v', 'i', 't'}, '5',  function() nvimux.go_to_tab(5) end},
      {{'n', 'v', 'i', 't'}, '6',  function() nvimux.go_to_tab(6) end},
      {{'n', 'v', 'i', 't'}, '7',  function() nvimux.go_to_tab(7) end},
      {{'n', 'v', 'i', 't'}, '8',  function() nvimux.go_to_tab(8) end},
      {{'n', 'v', 'i', 't'}, '9',  function() nvimux.go_to_tab(9) end},
    }
    nvimux.setup {
      config = {
        prefix = '<C-s>',
      },
      bindings = mappings
    }
  end
}
