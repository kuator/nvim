local g = vim.g
local o = vim.o
local bo = vim.bo
local wo = vim.wo
local cmd = vim.cmd
local exec = vim.api.nvim_exec
local fn = vim.fn
local api = vim.api
local uv = vim.loop

local disable_distribution_plugins = function()
  vim.g.loaded_gzip              = 1
  vim.g.loaded_tar               = 1
  vim.g.loaded_tarPlugin         = 1
  vim.g.loaded_zip               = 1
  vim.g.loaded_zipPlugin         = 1
  vim.g.loaded_getscript         = 1
  vim.g.loaded_getscriptPlugin   = 1
  vim.g.loaded_vimball           = 1
  vim.g.loaded_vimballPlugin     = 1
  vim.g.loaded_matchit           = 1
  vim.g.loaded_matchparen        = 1
  vim.g.loaded_2html_plugin      = 1
  vim.g.loaded_logiPat           = 1
  vim.g.loaded_rrhelper          = 1
  vim.g.loaded_netrw             = 1
  vim.g.loaded_netrwPlugin       = 1
  vim.g.loaded_netrwSettings     = 1
  vim.g.loaded_netrwFileHandlers = 1
end

-- Do not source the default filetype.vim
vim.g.did_load_filetypes = 1

disable_distribution_plugins()

-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

local is_bootstrap = false

if not vim.loop.fs_stat(vim.fn.glob(install_path)) then
  is_bootstrap = true
  os.execute('git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  -- use 'ludovicchabant/vim-gutentags'
  --
  use "nathom/filetype.nvim"
  
  use {'lewis6991/impatient.nvim',
    -- rocks = 'mpack',
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

  -- use {
  --   'leafOfTree/vim-vue-plugin';
  --   ft = 'vue';
  -- };
  
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
      -- vim.g.space_nvim_transparent_bg = true
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

   if is_bootstrap then
     require('packer').sync()
   end

end)

if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end


--rg
if fn.executable("rg") then
  o.grepprg="rg --vimgrep --no-heading --hidden --smart-case --no-ignore-vcs --ignore-file ~/.config/.ignore"
  o.grepformat='%f:%l:%c:%m,%f:%l:%m'
end

o.termguicolors = true

-- fdfind 
-- location list needs this to work with fdfind
o.errorformat = o.errorformat .. ',%f'

o.clipboard = 'unnamedplus'
o.updatetime=100

g.mapleader = ' '

--searching
o.incsearch = true
o.hlsearch = true
o.ignorecase = true
o.smartcase = true


o.swapfile = true
o.backup = true
o.backupcopy = 'yes'
o.undofile = true

folders = { directory = 'swap', backupdir = 'backup', undodir= 'undo'}
for option, folder in pairs(folders) do
  local path = fn.expand(fn.stdpath('data') .. '/' .. folder .. '//')
  o[option] = path
  if not uv.fs_stat(path) then uv.fs_mkdir(path, 493) end
end

-- interactive substitute
o.inccommand = 'split'


-- hidden buffers
o.hidden = true

vim.api.nvim_set_keymap('n', '<a-c>', ':', {noremap=true})
vim.api.nvim_set_keymap('v', '<a-c>', ':', {noremap=true})
vim.api.nvim_set_keymap('i', 'kj', '<esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-l>', '<c-l>:nohls<cr>', {noremap=true, silent=true})

vim.cmd([[nnoremap <leader>ec  :edit <c-r>=fnameescape(expand('%:p:h')).'/*'<cr>]])
vim.cmd([[nnoremap <leader>en  :edit <c-r>=stdpath('config').'/**/*'<cr>]])
vim.api.nvim_set_keymap('n', '<leader>lg', ':silent lgrep<space>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>lf', [[:silent lexpr system('fdfind --hidden --no-ignore-vcs --ignore-file ~/.config/.ignore -g "*"')<left><left><left><left>]], {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>lt', ':silent ltag <space>/', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>cc', ':silent cclose<bar>lclose<cr>', {noremap=true})
vim.api.nvim_set_keymap('n', 'cd', ':lcd %:p:h<bar>pwd<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', 'cu', ':lcd ..<bar>pwd<cr>', {noremap=true, silent=true})

-- https://vi.stackexchange.com/a/2682
vim.cmd([[nnoremap <a-j> :m .+1<CR>==]])
vim.cmd([[nnoremap <a-k> :m .-2<CR>==]])
vim.cmd([[inoremap <a-j> <Esc>:m .+1<CR>==gi]])
vim.cmd([[inoremap <a-k> <Esc>:m .-2<CR>==gi]])
vim.cmd([[xnoremap <a-j> :m '>+1<CR>gv=gv]])
vim.cmd([[xnoremap <a-k> :m '<-2<CR>gv=gv]])


-- https://oroques.dev/notes/neovim-init/
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = true}'  -- enabled in visual mode

-- https://www.reddit.com/r/vim/comments/bmh977/automatically_open_quickfix_window_after/
cmd 'autocmd QuickFixCmdPost [^l]* cwindow'
cmd 'autocmd QuickFixCmdPost l* lwindow'

o.termguicolors = true

o.number = true
o.relativenumber = true
o.wrap = false

vim.cmd('filetype plugin on')

o.expandtab = true
bo.expandtab = true
o.shiftwidth = 2
bo.shiftwidth = 2
-- when 'sts' is negative, the value of 'shiftwidth' is used.
o.softtabstop = -1
bo.softtabstop = -1
o.autoindent = true
bo.autoindent = true

o.splitbelow = true
o.splitright = true
o.signcolumn = 'yes'


vim.api.nvim_set_keymap('n', 'csfs', ':cs f s ', {noremap=true})
vim.cmd [[set cscopequickfix=s-,c-,d-,i-,t-,e-]]

vim.cmd[[tnoremap <esc> <C-\><C-n>]]

vim.cmd[[tnoremap kj <C-\><C-n>]]

-- vim.cmd('autocmd BufWinEnter,WinEnter term://* startinsert')
-- vim.cmd('autocmd TermOpen * setlocal nonumber norelativenumber | startinsert')

vim.cmd([[command! -nargs=1 RenameTerminalBuffer :lua vim.b.term_title = <q-args> .. ' (' .. vim.fn.bufname('%') .. ')']])
-- vim.cmd([[nmap <leader>tr :RenameTerminalBuffer<space>]])
vim.api.nvim_set_keymap('n', 'rt', ':RenameTerminalBuffer<space>',{noremap=false})
