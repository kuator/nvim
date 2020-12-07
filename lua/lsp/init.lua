-- local lsp_status = require('lsp-status')
-- local diagnostic = require('diagnostic')
local completion = require('completion')
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  -- lsp_status.on_attach(client, bufnr)
  -- diagnostic.on_attach(client, bufnr)
  completion.on_attach(client, bufnr)

  -- Keybindings for LSPs
  vim.fn.nvim_set_keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>ge", "<cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>gh", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>gf", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>gt", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>gw", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<a-.>", "<cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true, silent = true})
  vim.api.nvim_command('setlocal omnifunc=lua.vim.lsp.omnifunc')
end
-- lsp_status.register_progress()
-- lsp_status.config({
--   status_symbol = '',
--   indicator_errors = 'e',
--   indicator_warnings = 'w',
--   indicator_info = 'i',
--   indicator_hint = 'h',
--   indicator_ok = 'ok',
-- })



---[[
-- nvim_lsp.ccls.setup{
--   on_attach = on_attach,
--   capabilities = {
--      textDocument = {
--        completion = {
--         completionItem = {
--           snippetSupport=true
--         }
--        }
--      }
--   },
--   init_options = {
--     cache = {
--       directory = '/tmp/ccls/cache'
--     }
--   }
--   }

 nvim_lsp.clangd.setup{
     -- callbacks = lsp_status.extensions.clangd.setup(),
     on_attach = on_attach,
     capabilities = {
        textDocument = {
          completion = {
           completionItem = {
             snippetSupport=true
           }
          }
        }
     },
     init_options = {
         usePlaceholders = true,
         completeUnimported = true,
         clangdFileStatus = true
     }
     -- capabilities = lsp_status.capabilities
   }


--[[
nvim_lsp.ccls.setup{
  on_attach=on_attach,
  ccls = {
    completion = {
      enableSnippetInsertion = true
    }
  }
}
--]]

nvim_lsp.jedi_language_server.setup{
  on_attach=on_attach,
  init_options = {
    disableSnippets = false,
  },
  capabilities = {
     textDocument = {
       completion = {
        completionItem = {
          snippetSupport=true
        }
       }
     }
  },
}

-- nvim_lsp.pyls.setup{
--   on_attach = on_attach,
--   capabilities = {
--      textDocument = {
--        completion = {
--         completionItem = {
--           snippetSupport=true
--         }
--        }
--      }
--   },
--   -- capabilities = lsp_status.capabilities
--   settings = {
--     pyls = {
--       plugins = {
--         jedi_completion = {
--           fuzzy = true,
--           include_params = true
--         },
--         mccabe = {
--           enabled = false
--         },
--         pycodestyle = {
--           enabled = false
--         },
--         flake8 = {
--           enabled = true
--         },
--         pydocstyle = {
--           enabled = false
--         },
--         pyflakes = {
--           enabled = false
--         },
--         pylint = {
--           enabled = false
--         },
--         yapf = {
--           enabled = false
--         },
--       }
--     }
--   }
-- }


nvim_lsp.sumneko_lua.setup{
      cmd = { "/home/evakuator/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/bin/Linux/lua-language-server", "-E", "/home/evakuator/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/ma in.lua" },
      on_attach = on_attach,
      capabilities = {
        textDocument = {
          completion = {
            completionItem = {
              snippetSupport=true
            }
          }
        }
      },
      settings = {
        Lua = {
          completion= {
            -- keywordSnippet= "Enable",
            callSnippet="Both"
        }
    }
  }
}

nvim_lsp.vimls.setup{
  on_attach = on_attach,
  -- capabilities = lsp_status.capabilities
}
nvim_lsp.tsserver.setup{
  on_attach = on_attach,
}

nvim_lsp.html.setup{
  cmd = {"vscode-html-language-server", "--stdio"},
  on_attach = on_attach,
  capabilities = {
       textDocument = {
           completion = {
               completionItem = {
                   snippetSupport = true
               }
           }
       }
  }
}

nvim_lsp.cssls.setup{
  -- cmd = {"css-languageserver", "--stdio"},
  cmd = {"vscode-css-language-server", "--stdio"},
  on_attach = on_attach,
  -- capabilities = lsp_status.capabilities,
  settings = {
    css = {
      validate = false
    },
    less = {
      validate = true
    },
    scss = {
      validate = true
    }
  },
  capabilities = {
       textDocument = {
           completion = {
               completionItem = {
                   snippetSupport = true
               }
           }
       }
  }
}

nvim_lsp.gdscript.setup{
  on_attach=on_attach,
  godot = {
    host = "127.0.0.1",
    filetypes = {"gd", "gdscript"},
    port = 6008
  }
}

-- nvim_lsp.rust_analyzer.setup{
  -- on_attach = on_attach,
  -- capabilities = lsp_status.capabilities
-- }

-- nvim_lsp.elixirls.setup{
  -- on_attach = on_attach,
  -- capabilities = lsp_status.capabilities
-- }

-- nvim_lsp.gopls.setup{
  -- on_attach = on_attach,
  -- capabilities = lsp_status.capabilities
-- }


local get_python_tool = function(bin_name)
  local result = bin_name
  if os.getenv('VIRTUAL_ENV') then
    local venv_bin_name = os.getenv('VIRTUAL_ENV') .. '/bin/' .. bin_name
    if vim.fn.executable(venv_bin_name) == 1 then
      result = venv_bin_name
    end
  end
  return result
end

nvim_lsp.diagnosticls.setup{
  filetypes={'javascript', 'python', 'markdown'},
  init_options = {
    linters = {
      flake8 = {
        command = get_python_tool('flake8');
        args = {'--stdin-display-name'; '%filepath'; '-'};
        sourceName = 'flake8';
        debounce = 250;
        formatLines = 1;
        formatPattern = {'^[^:]+:(\\d+):((\\d+):)?\\s+(.+)$';
        {line = 1; column = 3; message = 4}};
        rootPatterns = {''};
      },
      eslint = {
        command = './node_modules/.bin/eslint',
        rootPatterns = {'.git'},
        debounce = 100,
        args = {
          '--stdin',
          '--stdin-filename',
          '%filepath',
          '--format',
          'json'
        },
        sourceName = 'eslint',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '${message} [${ruleId}]',
          security = 'severity'
        },
        securities = {
          [2] = 'error',
          [1] = 'warning',
        },
      },
      markdownlint = {
        command = 'markdownlint',
        rootPatterns = { '.git' },
        isStderr = true,
        debounce = 100,
        args = { '--stdin' },
        offsetLine = 0,
        offsetColumn = 0,
        sourceName = 'markdownlint',
        securities = {
          undefined = 'hint'
        },
        formatLines = 1,
        formatPattern = {
          '^.*:(\\d+)\\s+(.*)$',
          {
            line = 1,
            column = -1,
            message = 2,
          }
        }
      },
    },
    filetypes = {
      javascript = 'eslint',
      python = 'flake8',
      markdown = 'markdownlint',
    },
    formatters = {
      prettier = {
        command = "./node_modules/.bin/prettier",
        args = {"--stdin-filepath" ,"%filepath", '--single-quote', '--print-width 120'}
      }
    },
    formatFiletypes = {
      javascript = "prettier"
    },
  }
}

nvim_lsp.angularls.setup{
  on_attach = on_attach
}
