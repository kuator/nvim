return function()
  -- local completion = require('completion')
  -- require('lspkind').init()
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
    vim.api.nvim_set_keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<leader>gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<leader>gt", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<leader>gw", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<a-.>", "<cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true, silent = true})
    -- vim.api.nvim_command('setlocal omnifunc=v:lua.vim.lsp.omnifunc')
  end

  -- configs.emmet_ls = {
  --   default_config = {
  --     cmd = {'emmet-ls', '--stdio'},
  --     filetypes = {'html', 'css'};
  --     root_dir = function()
  --       return vim.loop.cwd()
  --     end;
  --     settings = {};
  --   };
  -- }

  -- lspconfig.emmet_ls.setup { on_attach = on_attach }

  lspconfig.bashls.setup { on_attach = on_attach }


   lspconfig.clangd.setup{
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
     }

  lspconfig.rust_analyzer.setup({ 
    on_attach=on_attach,
    capabilities = {
       textDocument = {
         completion = {
          completionItem = {
            snippetSupport=true
          }
         }
       }
    },
  })


  -- lspconfig.jedi_language_server.setup{
  --   on_attach=on_attach,
  --   init_options = {
  --     disableSnippets = false,
  --   },
  --   capabilities = {
  --      textDocument = {
  --        completion = {
  --         completionItem = {
  --           snippetSupport=true
  --         }
  --        }
  --      }
  --   },
  -- }

  -- require'lspconfig'.pyls.setup{
  --   on_attach = on_attach,
  -- }

  require 'pylance'
  lspconfig.pylance.setup{
    on_attach = on_attach,
    -- cmd = {'node', '/home/evakuator/.vscode/extensions/ms-python.vscode-pylance-2021.3.2/dist/server.bundle.js', '--stdio'},
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "basic",
          completeFunctionParens = true,
          extraPaths={'env'},
        }
      }
    }
  }




  -- lspconfig.sumneko_lua.setup{
  --       cmd = { '/opt/lua-language-server/bin/Linux/lua-language-server', '-E', '/opt/lua-language-server/main.lua' }, 
  --       on_attach = on_attach,
  --       capabilities = {
  --         textDocument = {
  --           completion = {
  --             completionItem = {
  --               snippetSupport=true
  --             }
  --           }
  --         }
  --       },
  --       settings = {
  --         Lua = {
  --           completion= {
  --             keywordSnippet="Replace",
  --             callSnippet="Replace"
  --           },
  --           runtime = {
  --             -- Tell the language server which version of Lua you're using (LuaJIT in the case of Neovim)
  --             version = 'LuaJIT',
  --             -- Setup your lua path
  --             -- path = vim.split(package.path, ';'),
  --           },
  --           diagnostics = {
  --             -- Get the language server to recognize the `vim` global
  --             globals = {'vim', 'use', 'love'},
  --           },
  --           workspace = {
  --             -- Make the server aware of Neovim runtime files
  --             library = {
  --               [vim.fn.expand('$VIMRUNTIME/lua')] = true,
  --               [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
  --             },
  --           },
  --         }
  --   }
  -- }

  lspconfig.vimls.setup{
    on_attach = on_attach,
  }

  lspconfig.texlab.setup{
    on_attach = on_attach,
  }

  lspconfig.tsserver.setup{
    on_attach = on_attach,
  }
  -- nvim_lsp.denols.setup{
  --   on_attach = on_attach,
  -- }

  -- nvim_lsp.pyright.setup{
  --   on_attach = on_attach,
  -- }


  lspconfig.html.setup{
    cmd = {"vscode-html-language-server", "--stdio"},
    filetypes = { "html", "htmldjango" },
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

  lspconfig.cssls.setup{
    cmd = {"vscode-css-language-server", "--stdio"},
    on_attach = on_attach,
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

  lspconfig.gdscript.setup{
    on_attach=on_attach,
    godot = {
      host = "127.0.0.1",
      filetypes = {"gd", "gdscript"},
      port = 6008
    }
  }

  -- stolen from https://github.com/fsouza/vimfiles
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

  -- maybe switch to efm-language-server in the future

  -- doesn't work, somehow
  --nvim_lsp.angularls.setup{
   -- on_attach = on_attach
  --}

  local function get_node_modules(root_dir)
    -- util.find_node_modules_ancestor()
    local root_node = root_dir .. "/node_modules"
    local stats = uv.fs_stat(root_node)
    if stats == nil then
      return nil
    else
      return root_node
    end
  end

  local default_node_modules = get_node_modules(vim.fn.getcwd())

  local ngls_cmd = {
    "ngserver",
    "--stdio",
    "--tsProbeLocations",
    default_node_modules,
    "--ngProbeLocations",
    default_node_modules
  }

  lspconfig.angularls.setup {
    cmd = ngls_cmd,
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {'html'},
    on_new_config = function(new_config)
      new_config.cmd = ngls_cmd
    end
  }

  lspconfig.vuels.setup{
    on_attach = on_attach
  }



  -- I think you don't have to. You could do require('compe.helper').convert_lsp = function(request_position, response) ... end
  -- where ... is your modified version of the function
  -- but it would break if the author decides to change the interfaces


  -- lspconfig.efm.setup {
  --   init_options = {documentFormatting = true},
  --   filetypes = {
  --     'css',
  --     'html',
  --   },
  --   settings = {
  --       rootMarkers = {".git/", "package.json"},
  --       languages = {
  --           css = {
  --               -- {formatCommand = "prettierd ${INPUT}", formatStdin = true}
  --               {
  --                formatCommand = 'prettier_d_slim --config-precedence prefer-file --stdin --stdin-filepath ${INPUT}',
  --                formatStdin = true,
  --               }
  --           },
  --           html = {
  --               -- {formatCommand = "prettierd ${INPUT}", formatStdin = true}
  --               {
  --                formatCommand = 'prettier_d_slim --config-precedence prefer-file --stdin --stdin-filepath ${INPUT}',
  --                formatStdin = true,
  --               }
  --           }
  --       }
  --   }
-- }


end
