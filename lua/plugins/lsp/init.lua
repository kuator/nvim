local function set_mason_lsp(servers)
  local has_value = require('utils').has_value
  local ensure_installed = vim.tbl_filter(function(d)
    local to_exclude = {"pylance", "csharp_ls", "nginx_language_server"}
    return not has_value(to_exclude, d)
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
      "black",
      "jq",
      "prettierd",
      "ruff",
      "stylua",
      "google-java-format",
      "checkstyle",
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

local function efm_black()
  local fs = require("efmls-configs.fs")

  local formatter = "black"

  local command = string.format(
    "%s --no-color -q $(echo ${--useless:rowStart} ${--useless:rowEnd} | xargs -n4 -r sh -c 'echo --line-ranges=$(($1+1))-$(($3+1))') -",
    fs.executable(formatter)
  )

  return {
    formatCanRange = true,
    formatCommand = command,
    formatStdin = true,
  }
end

local function efm_checkstyle()
  return {
    lintCommand = [[checkstyle -c=/google_checks.xml ${INPUT}]],
    lintFormats = { "[WARN] %f:%l:%c: %m" },
    lintIgnoreExitCode = true,
  }
end

local function efm_stylua()
  local fs = require("efmls-configs.fs")

  local formatter = "stylua"

  local command = string.format(
    "%s --indent-type Spaces --indent-width 2 --color Never ${--range-start:charStart} ${--range-end:charEnd} -",
    fs.executable(formatter)
  )

  return {
    formatCanRange = true,
    formatCommand = command,
    formatStdin = true,
  }
end

local function efm_google_java_format()
  local fs = require('efmls-configs.fs')

  local formatter = 'google-java-format'


  local command = fs.executable("google-java-format")
      .. " $(echo -n ${--useless:rowStart} ${--useless:rowEnd}"
      .. " | xargs -n4 -r sh -c 'echo"
      .. " --skip-sorting-imports" -- Do not fix the import order.
      .. " --skip-removing-unused-imports" -- Do not remove unused imports.
      .. " --skip-reflowing-long-strings" -- Do not reflow string literals that exceed the column limit.
      .. " --skip-javadoc-formatting" -- Do not reformat javadoc.
      .. " --lines $(($1+1)):$(($3+1))'" -- Line range(s) to format, like 5:10 (1-based; default is all).
      .. ") -"

  local is_windows = vim.fn.has('win32') == 1
  if is_windows then
    command = string.format('%s -', fs.executable(formatter))
  end

  return {
    formatCanRange = not is_windows,
    formatCommand = command,
    formatStdin = true,
    rootMarkers = {
        ".project",
        "classpath",
        "pom.xml",
    },
  }
  end

local function efm_ls_config()
  local eslint = require("efmls-configs.linters.eslint")
  local prettier_d = require("efmls-configs.formatters.prettier_d")
  -- local ruff = require("efmls-configs.linters.ruff")
  local google_java_format = require("efmls-configs.formatters.google_java_format")

  -- latexindent $(echo ${--useless:rowStart} ${--useless:rowEnd} | xargs -n4 -r sh -c 'echo --lines $(($1+1))-$(($3+1))')

  local languages = {
    typescript = { eslint, prettier_d },
    javascript = { eslint, prettier_d },
    lua = { efm_stylua() },
    html = { prettier_d },
    python = { efm_black() },
    java = { efm_checkstyle(), efm_google_java_format() },
  }

  mason_tool_installer()

  -- Or use the defaults provided by this plugin
  -- check doc/SUPPORTED_LIST.md for the supported languages
  --
  -- local languages = require('efmls-configs.defaults').languages()

  local efmls_config = {
    filetypes = vim.tbl_keys(languages),
    settings = {
      lintDebounce = "1s",
      formatDebounce = "1000ms",
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
    -- "pylance",
    -- "pylsp",
    "efm",
    "basedpyright",
    "lua_ls",
    "emmet_language_server",
    "dockerls",
    "ruff",
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
    "jsonls",
    "yamlls",
    "nginx_language_server",
    "omnisharp",
    -- "clangd",
    "gopls",
    -- "csharp_ls",
    -- "ruby_ls",
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
    basedpyright = {
      skip_install = true,
      settings = {
        verboseOutput = false,
        autoImportCompletion = true,
        basedpyright = {
          disableOrganizeImports = true,
          analysis = {
            typeCheckingMode = "off",
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            diagnosticMode = "openFilesOnly",
            indexing = true,
          },
        },
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
    pylsp = {
      settings = {
        pylsp = {
          plugins = {
            flake8 = {
              enabled = true
            },
            jedi_completion = {
              enabled = true,
              fuzzy = true
            },
            jedi_definition = {
              enabled = true
            },
            rope_autoimport = {
              enabled = true
            }
          }
        }
      }
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
    omnisharp = {
      cmd = { vim.fn.stdpath("data") .. '/mason/bin/omnisharp' },
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

  set_mason_lsp(servers)
  setup_lsps(servers, settings)
end

return {

  -- 'yioneko/nvim-vtsls',
  "mfussenegger/nvim-jdtls",
  {
    'mrcjkb/rustaceanvim',
    ft = { 'rust' },
  },
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
