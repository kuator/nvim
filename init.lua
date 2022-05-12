local g = vim.g
local o = vim.o
local bo = vim.bo
local wo = vim.wo
local cmd = vim.cmd
local exec = vim.api.nvim_exec
local fn = vim.fn
local api = vim.api

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

o.termguicolors = true

-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', { command = 'source <afile> | PackerCompile', group = packer_group, pattern = 'init.lua' })

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  -- use 'ludovicchabant/vim-gutentags'
  --
  use "nathom/filetype.nvim"
  
  use {'lewis6991/impatient.nvim',
    rocks = 'mpack',
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
    'tjdevries/complextras.nvim',
    opt = true;
    wants = 'plenary.nvim';
    keys = {{'i'; '<c-x><c-w>'}};
    config=function() 
      vim.cmd[[inoremap <c-x><c-w> <c-r>=luaeval("require('complextras').complete_line_from_cwd()")<CR>]]
    end
  };

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
  
  -- use {'folke/tokyonight.nvim',
  --   config = function()
  --     vim.g.tokyonight_transparent = true
  --     vim.g.tokyonight_style = "night"
  --     vim.cmd[[colorscheme tokyonight]]
  --   end
  -- };
   

  use {'kana/vim-textobj-user', opt=true};
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
     'romainl/Apprentice',
  };

  use { 
     'seandewar/bad-apple.nvim',
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

      local finders = require('telescope.finders')
      local pickers = require('telescope.pickers')
      local sorters = require('telescope.sorters')
      local telescope_config = require("telescope.config").values

      local bookmarks = function(opts)
        pickers.new(opts, {
          prompt_title = "Bookmarks",
          sorter = telescope_config.generic_sorter(opts),
          finder = finders.new_table {
            results = {
              "~/.config/nvim",
              "~/.config/emacs",
              "~/Documents/programming/treesitter-unit/lua/treesitter-unit",
              "~/Documents/payda/paydabackend/",
              "~/Documents/payda/payda-front/",
            },
          },
          attach_mappings = function(_, map)
            return true
          end
        }):find()

      end
      ---------------------
      local filter = vim.tbl_filter
      local make_entry = require "telescope.make_entry"
      local previewers = require "telescope.previewers"
      local conf = require("telescope.config").values
      local action_set = require "telescope.actions.set"
      require('telescope.builtin').buffers = function(opts)
        local bufnrs = filter(function(b)
          if 1 ~= vim.fn.buflisted(b) then
            return false
          end
          -- only hide unloaded buffers if opts.show_all_buffers is false, keep them listed if true or nil
          if opts.show_all_buffers == false and not vim.api.nvim_buf_is_loaded(b) then
            return false
          end
          if opts.ignore_current_buffer and b == vim.api.nvim_get_current_buf() then
            return false
          end
          if opts.only_cwd and not string.find(vim.api.nvim_buf_get_name(b), vim.loop.cwd(), 1, true) then
            return false
          end
          return true
        end, vim.api.nvim_list_bufs())
        if not next(bufnrs) then
          return
        end
        if opts.sort_mru then
          table.sort(bufnrs, function(a, b)
            return vim.fn.getbufinfo(a)[1].lastused > vim.fn.getbufinfo(b)[1].lastused
          end)
        end

        local buffers = {}
        local default_selection_idx = 1
        for _, bufnr in ipairs(bufnrs) do
          local flag = bufnr == vim.fn.bufnr "" and "%" or (bufnr == vim.fn.bufnr "#" and "#" or " ")

          if opts.sort_lastused and not opts.ignore_current_buffer and flag == "#" then
            default_selection_idx = 2
          end

          local buf_info = vim.fn.getbufinfo(bufnr)[1]

          local cloned_buf_info = vim.deepcopy(buf_info)
          if cloned_buf_info.variables.term_title then
            cloned_buf_info.name = cloned_buf_info.variables.term_title
          end

          local element = {
            bufnr = bufnr,
            flag = flag,
            info = cloned_buf_info,
          }

          if opts.sort_lastused and (flag == "#" or flag == "%") then
            local idx = ((buffers[1] ~= nil and buffers[1].flag == "%") and 2 or 1)
            table.insert(buffers, idx, element)
          else
            table.insert(buffers, element)
          end
        end

        if not opts.bufnr_width then
          local max_bufnr = math.max(unpack(bufnrs))
          opts.bufnr_width = #tostring(max_bufnr)
        end

        pickers.new(opts, {
          prompt_title = "Buffers",
          finder = finders.new_table {
            results = buffers,
            entry_maker = opts.entry_maker or make_entry.gen_from_buffer(opts),
          },
          previewer = previewers.buffers.new(opts),
          sorter = conf.generic_sorter(opts),
          default_selection_index = default_selection_idx,
          attach_mappings = function(_, _)
            action_set.select:enhance {
              post = function()
                local entry = action_state.get_selected_entry()
                vim.api.nvim_win_set_cursor(0, { entry.lnum, entry.col or 0 })
              end,
            }
            return true
          end,
        }):find()
      end
      --------------------
      require('telescope.builtin').terminals = function(opts)
        local bufnrs = filter(function(b)
          if 1 ~= vim.fn.buflisted(b) then
              return false
          end
          if not opts.show_all_buffers and not vim.api.nvim_buf_is_loaded(b) then
            return false
          end
          if opts.ignore_current_buffer and b == vim.api.nvim_get_current_buf() then
            return false
          end
          return true
        end, vim.api.nvim_list_bufs())
        if not next(bufnrs) then return end
      
        local t_bufnrs = filter(function(b)
            return vim.fn.getbufinfo(b)[1].variables.term_title ~= nil
        end, bufnrs)
        if not next(t_bufnrs) then return end
      
        local buffers = {}
        local default_selection_idx = 1
        for _, bufnr in ipairs(t_bufnrs) do
          local flag = bufnr == vim.fn.bufnr('') and '%' or (bufnr == vim.fn.bufnr('#') and '#' or ' ')
      
          if opts.sort_lastused and not opts.ignore_current_buffer and flag == "#" then
            default_selection_idx = 2
          end

          local buf_info = vim.fn.getbufinfo(bufnr)[1]

          local cloned_buf_info = vim.deepcopy(buf_info)
          if cloned_buf_info.variables.term_title then
            cloned_buf_info.name = cloned_buf_info.variables.term_title
          end
      
          local element = {
            bufnr = bufnr,
            flag = flag,
            info = cloned_buf_info,
          }
      
          if opts.sort_lastused and (flag == "#" or flag == "%") then
            local idx = ((buffers[1] ~= nil and buffers[1].flag == "%") and 2 or 1)
            table.insert(buffers, idx, element)
          else
            table.insert(buffers, element)
          end
        end
      
        if not opts.bufnr_width then
          local max_bufnr = math.max(unpack(bufnrs))
          opts.bufnr_width = #tostring(max_bufnr)
        end
      
        pickers.new(opts, {
          prompt_title = 'Terminals',
          finder    = finders.new_table {
            results = buffers,
            entry_maker = opts.entry_maker or make_entry.gen_from_buffer(opts)
          },
          -- previewer = conf.grep_previewer(opts),
          previewer = previewers.buffers.new(opts),
          sorter = conf.generic_sorter(opts),
          default_selection_index = default_selection_idx,
        }):find()
      end
      ---------------------

      require('telescope.builtin').bookmarks = bookmarks
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('frecency')

      -- vim.cmd [[nnoremap <leader>tf <cmd>Telescope find_files<cr>]]
      vim.api.nvim_set_keymap('n', '<leader>tf', [[<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({find_command = {"fdfind", "--no-ignore-vcs", "--hidden", "--ignore-file", vim.fn.expand("~/.config/.ignore")}}))<cr>]], { noremap = true, silent = true })
      vim.cmd [[nnoremap <leader>tb <cmd>Telescope bookmarks<cr>]]
      vim.cmd [[nnoremap <leader>tg <cmd>Telescope live_grep<cr>]]
      -- vim.cmd [[nnoremap <leader>tb <cmd>Telescope buffers<cr>]]
      vim.cmd [[nnoremap <leader>th <cmd>Telescope help_tags<cr>]]
      vim.cmd [[nnoremap <leader>tt <cmd>Telescope terminals<cr>]]
      vim.cmd [[nnoremap <leader>tb <cmd>Telescope buffers<cr>]]
      vim.cmd [[nnoremap <leader>tp <cmd>Telescope bookmarks<cr>]]
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

  -- use {
  --  'nvim-treesitter/nvim-treesitter-refactor',
  --  opt=true,
  --  wants = 'nvim-treesitter',
  --  config = function() 
  --   -- vim.cmd('hi TSDefinitionUsage cterm=underline gui=underline')
  --   -- vim.cmd('hi TSDefinition cterm=underline gui=underline')
  --   require'nvim-treesitter.configs'.setup {
  --     refactor = {
  --      highlight_current_scope = { enable = true },
  --      highlight_definitions = { enable = true },
  --     },
  --   }
  --  end,
  --  event = 'BufReadPre'
  -- }

  use {
      'kuator/some-python-plugin.nvim',
      run = './install.sh',
  }

  -- use { "hrsh7th/cmp-buffer", opt=true }
  
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use {'L3MON4D3/LuaSnip', config = function()
    local function prequire(...)
    local status, lib = pcall(require, ...)
    if (status) then return lib end
        return nil
    end

    local luasnip = prequire('luasnip')
    local cmp = prequire("cmp")

    local t = function(str)
        return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

    local check_back_space = function()
        local col = vim.fn.col('.') - 1
        if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
            return true
        else
            return false
        end
    end

    _G.tab_complete = function()
        if cmp and cmp.visible() then
            cmp.select_next_item()
        elseif luasnip and luasnip.expand_or_jumpable() then
            return t("<Plug>luasnip-expand-or-jump")
        elseif check_back_space() then
            return t "<Tab>"
        else
            cmp.complete()
        end
        return ""
    end
    _G.s_tab_complete = function()
        if cmp and cmp.visible() then
            cmp.select_prev_item()
        elseif luasnip and luasnip.jumpable(-1) then
            return t("<Plug>luasnip-jump-prev")
        else
            return t "<S-Tab>"
        end
        return ""
    end

    vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
    vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
    vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
    vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
    vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
    vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})
  end
  }
  use 'saadparwaiz1/cmp_luasnip' 
  vim.cmd[[set completeopt=menu,menuone,noselect]]
  use {'hrsh7th/nvim-cmp', config = function ()

  local cmp = require'cmp'
    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
      }, {
        { name = 'buffer' },
      })
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
      }, {
        { name = 'buffer' },
      })
    })

  end}

  -- use {
  --   "hrsh7th/nvim-cmp",
  --   event = "InsertEnter", -- for lazyload
  --   requires = {
  --     { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
  --     { "f3fora/cmp-spell", after = "nvim-cmp" },
  --     { "hrsh7th/cmp-path", after = "nvim-cmp" },
  --     { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
  --     { "hrsh7th/cmp-calc", after = "nvim-cmp" },
  --   },
  --   config = function()
  --     -- your config
  --   end,
  -- }

  -- use { "lukas-reineke/indent-blankline.nvim" ,
  --   config = function() 
  --     vim.opt.listchars = {
  --       space = "⋅",
  --       eol = "↴",
  --     }
  --
  --     require("indent_blankline").setup {
  --       space_char_blankline = " ",
  --       show_current_context = true,
  --       -- char = "|",
  --       buftype_exclude = {"terminal"},
  --     }
  --   end,
  --   opt=true,
  --   event='BufReadPost',
  --   wants = 'nvim-treesitter'
  -- }

  use {
    'neovim/nvim-lspconfig',
    requires = 'some-python-plugin.nvim',
    config = function ()
      local uv = vim.loop
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

      local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
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
end)


--rg
if fn.executable("rg") then
  o.grepprg="rg --vimgrep --no-heading --hidden --smart-case --no-ignore-vcs --ignore-file ~/.config/.ignore"
  o.grepformat='%f:%l:%c:%m,%f:%l:%m'
end

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
o.directory = fn.expand(fn.stdpath('data') .. '/swap//')
o.backup = true
o.backupcopy = 'yes'
o.backupdir = fn.expand(fn.stdpath('data') .. '/backup//')
o.undofile = true
o.undodir = fn.expand(fn.stdpath('data') .. '/undo//')


if fn.isdirectory(o.directory) == 0 then fn.mkdir(o.directory, 'p') end
if fn.isdirectory(o.backupdir) == 0 then fn.mkdir(o.backupdir, 'p') end
if fn.isdirectory(o.undodir) == 0 then fn.mkdir(o.undodir, 'p') end

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
