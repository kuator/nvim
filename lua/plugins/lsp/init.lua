local function install_mason_lsp_servers(servers)
  local has_value = require("utils").has_value
  local ensure_installed = vim.tbl_filter(function(d)
    local to_exclude = { "pylance", "csharp_ls", "nginx_language_server" }
    return not has_value(to_exclude, d)
  end, servers)

  local mason_lspconfig_status_ok, lsp_installer = pcall(require, "mason-lspconfig")
  local mason_status_ok, mason = pcall(require, "mason")

  if mason_lspconfig_status_ok and mason_status_ok then
    lsp_installer.setup({ ensure_installed = ensure_installed })
  end
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


end

local function config()
  local servers = {
    "pylance",
    "ruff",
    "lua_ls",
    "emmet_language_server",
    "dockerls",
    "bashls",
    "lemminx",
    "html",
    "cssls",
    "awk_ls",
    "jsonls",
    "yamlls",
    "nginx_language_server",
    "gopls",
    "csharp_ls",
    "vtsls",
    "marksman",
  }

  local settings = {
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
    yaml = {
      settings = {
        yaml = {
          schemaStore = {
            -- You must disable built-in schemaStore support if you want to use
            -- this plugin and its advanced options like `ignore`.
            enable = false,
            -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
            url = "",
          },
          schemas = require("schemastore").yaml.schemas(),
        },
      },
    },
    ruff = {
      init_options = {
        documentFormatting = true,
        documentRangeFormatting = true,
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
    jsonls = {
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
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
            indexing = true,
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

  install_mason_lsp_servers(servers)
  setup_lsps(servers, settings)
end

return {

  "yioneko/nvim-vtsls",
  "mfussenegger/nvim-jdtls",
  {
    "mrcjkb/rustaceanvim",
    ft = { "rust" },
  },
  {
    "neovim/nvim-lspconfig",
    config = config,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "kuator/some-python-plugin.nvim",
      "b0o/SchemaStore.nvim",
      {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
          "ray-x/guihua.lua",
          "nvim-treesitter/nvim-treesitter",
        },
        config = function()
          require("go").setup()
        end,
        event = { "CmdlineEnter" },
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
        "someone-stole-my-name/yaml-companion.nvim",
        dependencies = {
          { "nvim-lua/plenary.nvim" },
          { "nvim-telescope/telescope.nvim" },
        },
        config = function()
          require("telescope").load_extension("yaml_schema")
        end,
      },
    },
  },
}
