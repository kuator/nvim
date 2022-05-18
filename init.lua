require "options"
require "keymaps"
require "autocmds"

-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

local bootstrap = false

if not vim.loop.fs_stat(vim.fn.glob(install_path)) then
   os.execute('git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
   bootstrap = true
   -- print "Installing packer close and reopen Neovim..."
   vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager

  -- use 'ludovicchabant/vim-gutentags'

  use "nathom/filetype.nvim"
  
  use {'lewis6991/impatient.nvim',
    config = function()
      require('impatient')
    end
  }

  use {
    'tpope/vim-commentary';
    opt = true;
    keys = {{'x'; 'gc'}; {'n'; 'gc'}};
  };

  use {
    'dhruvasagar/vim-zoom';
    opt = true;
    keys = {{'n'; '<c-w>m'}};
  };

  use {
    'tpope/vim-surround';
    opt = true;
    keys = {{'n'; 'ys'}; {'x'; 'S'}; {'n'; 'cs'}; };
  };

  use {
    'leafOfTree/vim-vue-plugin';
    ft = 'vue';
  };
  
  use {
    'MaxMEllon/vim-jsx-pretty';
    ft = {'javascript', 'javascriptreact'};
  };

  use {
    'inkarkat/vim-ReplaceWithRegister';
    opt = true;
    keys = {{'n'; 'gr'}; {'x'; 'gr'}; };
  };

  use {'nvim-lua/plenary.nvim', opt=true};

  use {
    'tpope/vim-unimpaired';
    opt = true;
    keys = {{'n'; '[p'}; {'n'; ']p'}; {'n'; '[l'}; {'n'; ']l'};  }
  };

  use {'wellle/targets.vim'};

  use {'liuchengxu/space-vim-dark',
    config = function()
      vim.cmd('colorscheme space-vim-dark')
      vim.cmd('hi Normal     ctermbg=NONE guibg=NONE')
      vim.cmd('hi LineNr     ctermbg=NONE guibg=NONE')
      vim.cmd('hi SignColumn ctermbg=NONE guibg=NONE')
      vim.cmd('hi CursorLineNr ctermbg=NONE guibg=NONE')
      vim.cmd('hi LineNr guifg=white guibg=NONE ctermfg=white ctermbg=NONE')
      vim.cmd('hi Comment cterm=italic gui=italic')
    end
  };
  
  use {'kana/vim-textobj-user', opt=true};

  use {
    'AckslD/nvim-trevJ.lua',
    opt=true,
    config = 'require("trevj").setup()',  -- optional call for configurating non-default filetypes etc

    -- uncomment if you want to lazy load
    module = 'trevj',

    -- an example for configuring a keybind, can also be done by filetype
    setup = function()
      vim.keymap.set('n', '<leader>j', function()
        require('trevj').format_at_cursor()
      end)
    end,
  }

  use {'noib3/nvim-compleet', opt=true};

  -- https://github.com/jedrzejboczar/toggletasks.nvim

  -- use {
  --   'nvim-lualine/lualine.nvim',
  --   requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  --   config=function() 
  --     require'lualine'.setup()
  --   end
  -- }


  use {
    'kana/vim-textobj-line';
    opt=true;
    wants='vim-textobj-user';
    setup='vim.g.textobj_line_no_default_key_mappings=true';
    keys = {{'o'; 'ar'}, {'o'; 'ir'}, {'x'; 'ar'}, {'x'; 'ir'}};
    config=function() 
      vim.api.nvim_set_keymap('o', 'ir', '<Plug>(textobj-line-i)',{})
      vim.api.nvim_set_keymap('x', 'ir', '<Plug>(textobj-line-i)',{})
      vim.api.nvim_set_keymap('o', 'ar', '<Plug>(textobj-line-a)',{})
      vim.api.nvim_set_keymap('x', 'ar', '<Plug>(textobj-line-a)',{})
    end;
  }

  use {
    'kana/vim-textobj-entire';
    opt=true;
    wants='vim-textobj-user';
    keys = {{'o'; 'ae'}, {'o'; 'ie'}, {'x'; 'ae'}, {'x'; 'ie'}};
  }

  use {
    'tpope/vim-repeat';
    opt = true;
    keys = {{'n'; '.'}};
  };


  use { 
    'tpope/vim-rsi',
    opt=true ,
    event = 'InsertEnter' 
  };

  use { 
     'seandewar/bad-apple.nvim',
     opt=true
  };

  use {
    'Julian/vim-textobj-variable-segment';
    opt = true;
    wants='vim-textobj-user';
    keys = {{'o'; 'iv'}; {'o'; 'av'}; {'x'; 'iv'}; {'x'; 'av'}; };
  };

  use {
    'mattn/emmet-vim';
    opt = true;
    setup=[[
      vim.g.user_emmet_mode = 'i'
      vim.g.user_emmet_leader_key = "<c-s>"
      vim.g.user_emmet_expandabbr_key = '<c-s><c-s>'
    ]],
    keys = {
      {'i'; '<c-s>'};
    };
    cmd = {'Emmet'; 'EmmetInstall'};
    };

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make', opt=true }
  use {'tami5/sql.nvim', opt=true}
  use {
    "nvim-telescope/telescope-frecency.nvim",
    opt = true,
    wants = {"sql.nvim"}
  }

  use {
    'nvim-telescope/telescope.nvim',
    wants = {
      'plenary.nvim',
      'telescope-fzf-native.nvim',
      'telescope-frecency.nvim',
    },
    opt=true,
    keys = {
      {'n'; '<leader>tf'};
      {'n'; '<leader>tb'};
      {'n'; '<leader>tg'};
      {'n'; '<leader>tt'};
      {'n'; '<leader>tp'};
    };
    cmd = {
      'Telescope'
    };
    config=function() 
      require('telescope').setup {
        extensions = {
          fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          }
        }
      }

      -- vim.cmd [[nnoremap <leader>tf <cmd>Telescope find_files<cr>]]
      vim.api.nvim_set_keymap('n', '<leader>tf', [[<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({find_command = {"fdfind", "--no-ignore-vcs", "--hidden", "--ignore-file", vim.fn.expand("~/.config/.ignore")}}))<cr>]], { noremap = true, silent = true })
      vim.cmd [[nnoremap <leader>tg <cmd>Telescope live_grep<cr>]]
      vim.cmd [[nnoremap <leader>tb <cmd>Telescope buffers<cr>]]
    end;
  }

  use {
    'lewis6991/gitsigns.nvim', wants = {'plenary.nvim'} ,
    event = 'BufRead',
    opt=true,
    config = function() require('gitsigns').setup() end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    opt = true,
    config = function()
      require'nvim-treesitter.configs'.setup {
      ensure_installed = { "python", "lua"}, 
      highlight = { enable = false },
    }
    end
  }

  use {
      'kuator/some-python-plugin.nvim',
  }

  use {
      'simrat39/symbols-outline.nvim',
      opt=true
  }

  use {
    'neovim/nvim-lspconfig',
    requires = 'some-python-plugin.nvim',
    config = function ()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local lspconfig = require('lspconfig')
      local configs = require'lspconfig/configs'
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      local on_attach = function(client, bufnr)
        -- completion.on_attach(client, bufnr)

        -- Keybindings for LSPs
        vim.api.nvim_set_keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
        vim.api.nvim_set_keymap("n", "<leader>ge", "<cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true, silent = true})
        vim.api.nvim_set_keymap("n", "<leader>gh", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
        vim.api.nvim_set_keymap("n", "<leader>gf", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap = true, silent = true})
        vim.api.nvim_set_keymap("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
        -- vim.api.nvim_set_keymap("n", "<leader>gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true, silent = true})
        vim.api.nvim_set_keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true, silent = true})
        vim.api.nvim_set_keymap("n", "<leader>gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true, silent = true})
        vim.api.nvim_set_keymap("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
        vim.api.nvim_set_keymap("n", "<leader>gt", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", {noremap = true, silent = true})
        vim.api.nvim_set_keymap("n", "<leader>gw", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", {noremap = true, silent = true})
        vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true, silent = true})
        vim.api.nvim_set_keymap("n", "<a-.>", "<cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true, silent = true})
        vim.api.nvim_command('setlocal omnifunc=v:lua.vim.lsp.omnifunc')
      end

      require 'pylance'
      lspconfig.pylance.setup{
        on_attach = on_attach,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off",
              completeFunctionParens = true,
              -- extraPaths={'env'},
            }
          }
        }
      }

      -- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
      lspconfig.tsserver.setup{
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
           completions = {completeFunctionCalls = true},
        }
      }

      end
  }

   -- broken
   use {
     'David-Kunz/treesitter-unit', wants = {'nvim-treesitter'} ,
     keys = {
       {'o'; 'iu'};
       {'o'; 'au'};
     };
     opt=true,
     config = function() 
       vim.api.nvim_set_keymap('x', 'iu', ':lua require"treesitter-unit".select()<CR>', {noremap=true})
       vim.api.nvim_set_keymap('x', 'au', ':lua require"treesitter-unit".select(true)<CR>', {noremap=true})
       vim.api.nvim_set_keymap('o', 'iu', ':<c-u>lua require"treesitter-unit".select()<CR>', {noremap=true})
       vim.api.nvim_set_keymap('o', 'au', ':<c-u>lua require"treesitter-unit".select(true)<CR>', {noremap=true})
       -- require"treesitter-unit".enable_highlighting('CursorLine')
     end
   }
   if bootstrap then
     require("packer").sync()
   end
end)
