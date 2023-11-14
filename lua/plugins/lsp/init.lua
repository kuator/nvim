local function set_mason_lsp(servers)
  local ensure_installed = vim.tbl_filter(function(d) return d ~= "pylance" end, servers)

  local mason_lspconfig_status_ok, lsp_installer = pcall(require, "mason-lspconfig")
  local mason_status_ok, mason = pcall(require, "mason")

  if mason_lspconfig_status_ok and mason_status_ok then
    -- require("mason").setup()
    lsp_installer.setup { ensure_installed = ensure_installed }
  end
end

local function setup_typescript()
  require("typescript-tools").setup {
    settings = {
      -- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
      complete_function_calls = true,
    },
  }
end

local function setup_lsps(servers, settings)
  local lspconfig = require("lspconfig")
  local configs = require("lspconfig.configs")
  local utils = require("utils")

  for _, k in ipairs(servers) do
    local opts = {
      capabilities = utils.capabilities,
    }
    if k == 'vtsls' then
      configs.vtsls = require("vtsls").lspconfig
    end
    if k == 'pylance' then
      require 'pylance'
    end
    if settings[k] ~= nil then
      opts = vim.tbl_deep_extend("force", settings[k], opts)
    end
    lspconfig[k].setup(opts)
  end

  setup_typescript()
end

local function config()
  local servers = {
    "pylance",
    "lua_ls",
    "emmet_language_server",

    -- "emmet_ls",

    -- tsserver = {
    --   settings = {
    --     completions = {completeFunctionCalls = true},
    --   }
    -- },
    "bashls",
    "html",
    "cssls",
    "awk_ls",
    "clangd",
    "gopls",
    -- "vtsls",
  }

  local settings = {
    gopls = {
      -- for postfix snippets and analyzers
      settings = {
        gopls = {
          experimentalPostfixCompletions = true,
          usePlaceholders = true,
          analyses = {
            unreachable = true,
            unusedparams = true,
            nilness = true,
            shadow = true,
          },
          staticcheck = true,
        }
      }
    },
    lua_ls = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          completion = {
            keywordSnippet = "Replace",
            callSnippet = "Replace"
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            }
          }
        }
      }
    },
    emmet_ls = {
      filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
    },
    pylance = {
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic",
            completeFunctionParens = true,
          }
        }
      }
    },
    vtsls = {
      settings = {
        typescript = {
          format = {
            enable = false
          },
          suggest = {
            completeFunctionCalls = true,
          },
        },
        javascript = {
          format = {
            enable = false
          },
          suggest = {
            completeFunctionCalls = true,
          },
        }
      }
    }
  }

  set_mason_lsp(servers)
  setup_lsps(servers, settings)
end




return {
  'kuator/some-python-plugin.nvim',
  -- 'yioneko/nvim-vtsls',
  'mfussenegger/nvim-jdtls',
  'pmizio/typescript-tools.nvim',
  -- require "plugins.lsp-plugins.null-ls",
  -- require "plugins.lsp-plugins.lspkind",
  -- require "plugins.lsp-plugins.aerial",
  -- require "plugins.lsp-plugins.rust-tools-nvim",
  {
    'neovim/nvim-lspconfig',
    config = config,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        dependencies = "mason.nvim"
      },
      {
        'j-hui/fidget.nvim',
        config = function()
          require "fidget".setup {}
        end
      },
      {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
          "SmiteshP/nvim-navic",
          "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        config = function()
          require("barbecue").setup()
        end,
      },
    },
  }
}
