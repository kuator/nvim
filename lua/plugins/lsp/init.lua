local function set_mason_lsp(servers)
  local ensure_installed = vim.tbl_filter(function(d)
    return d ~= "pylance"
  end, servers)

  local mason_lspconfig_status_ok, lsp_installer = pcall(require, "mason-lspconfig")
  local mason_status_ok, mason = pcall(require, "mason")

  if mason_lspconfig_status_ok and mason_status_ok then
    -- require("mason").setup()
    lsp_installer.setup({ ensure_installed = ensure_installed })
  end
end

local function mason_tool_installer()
  require("mason-tool-installer").setup({
    ensure_installed = {
      "ruff",
      "jq",
      "prettierd",
      "black",
      "stylua",
    },

    run_on_start = true,
  })
  require("mason-tool-installer").run_on_start()
end

local function setup_typescript()
  require("typescript-tools").setup({

    settings = {
      -- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
      complete_function_calls = true,
    },
  })
end

local function efm_ls_config()
  local eslint = require("efmls-configs.linters.eslint")
  local prettier = require("efmls-configs.formatters.prettier")
  local stylua = require("efmls-configs.formatters.stylua")
  local fs = require("efmls-configs.fs")

  local formatter = "stylua"

  local command = string.format(
    "%s  --indent-type Spaces --indent-width 2 --color Never ${--range-start:charStart} ${--range-end:charEnd} -",
    fs.executable(formatter)
  )

  stylua["command"] = command

  local ruff = require("efmls-configs.linters.ruff")
  local black = require("efmls-configs.formatters.black")
  local languages = {
    typescript = { eslint, prettier },
    javascript = { eslint, prettier },
    lua = { stylua },
    python = { ruff, black },
  }

  mason_tool_installer()

  -- Or use the defaults provided by this plugin
  -- check doc/SUPPORTED_LIST.md for the supported languages
  --
  -- local languages = require('efmls-configs.defaults').languages()

  local efmls_config = {
    filetypes = vim.tbl_keys(languages),
    settings = {
      rootMarkers = { ".git/" },
      languages = languages,
    },
    init_options = {
      documentFormatting = true,
      documentRangeFormatting = true,
    },
  }

  return efmls_config
end

local function setup_lsps(servers, settings)
  local lspconfig = require("lspconfig")
  local configs = require("lspconfig.configs")
  local utils = require("utils")

  for _, k in ipairs(servers) do
    local opts = {
      capabilities = utils.capabilities,
    }
    if k == "vtsls" then
      configs.vtsls = require("vtsls").lspconfig
    end
    if k == "pylance" then
      require("pylance")
    end
    if settings[k] ~= nil then
      opts = vim.tbl_deep_extend("force", settings[k], opts)
    end
    lspconfig[k].setup(opts)
  end

  require("go").setup()

  setup_typescript()
end

local function config()
  local servers = {
    "pylance",
    "efm",
    "lua_ls",
    "emmet_language_server",
    "ruby_ls",
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
    "csharp_ls",
    -- "vtsls",
  }

  local settings = {
    efm = efm_ls_config(),
    emmet_language_server = {
      filetypes = {
        "css",
        "eruby",
        "html",
        "javascript",
        "javascriptreact",
        "less",
        "sass",
        "scss",
        "svelte",
        "pug",
        "typescriptreact",
        "vue",
      },
    },
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
        },
      },
    },
    lua_ls = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          completion = {
            keywordSnippet = "Replace",
            callSnippet = "Replace",
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    },
    emmet_ls = {
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
    },
    pylance = {
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic",
            completeFunctionParens = true,
          },
        },
      },
    },
    vtsls = {
      settings = {
        typescript = {
          format = {
            enable = false,
          },
          suggest = {
            completeFunctionCalls = true,
          },
        },
        javascript = {
          format = {
            enable = false,
          },
          suggest = {
            completeFunctionCalls = true,
          },
        },
      },
    },
  }

  set_mason_lsp(servers)
  setup_lsps(servers, settings)
end

return {

  -- 'yioneko/nvim-vtsls',
  "mfussenegger/nvim-jdtls",
  -- require "plugins.lsp-plugins.null-ls",
  -- require "plugins.lsp-plugins.lspkind",
  -- require "plugins.lsp-plugins.aerial",
  -- require "plugins.lsp-plugins.rust-tools-nvim",

  -- {
  --   'jmederosalvarado/roslyn.nvim',
  --   config = function ()
  --     local utils = require('utils')
  --     require("roslyn").setup(
  --     {
  --       capabilities = utils.capabilities,
  --       on_attach = utils.on_attach,
  --     }
  --     )
  --   end
  -- },

  {
    "neovim/nvim-lspconfig",
    config = config,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "kuator/some-python-plugin.nvim",
      "pmizio/typescript-tools.nvim",
      {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
          "ray-x/guihua.lua",
          "nvim-treesitter/nvim-treesitter",
        },
        config = function()
          require("go").setup()
        end,
        -- event = {"CmdlineEnter"},
        ft = { "go", "gomod" },
        build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
      },
      {
        "williamboman/mason-lspconfig.nvim",
        dependencies = "mason.nvim",
      },
      {
        "j-hui/fidget.nvim",
        config = function()
          require("fidget").setup({})
        end,
      },
      {
        "Bekaboo/dropbar.nvim",
        -- optional, but required for fuzzy finder support
        dependencies = {
          "nvim-telescope/telescope-fzf-native.nvim",
        },
      },
      {
        "creativenull/efmls-configs-nvim",
        dependencies = {
          "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
      },
    },
  },
}
