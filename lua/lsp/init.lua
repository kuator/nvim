-- local lsp_status = require('lsp-status')
-- local diagnostic = require('diagnostic')
local completion = require('completion')
local nvim_lsp = require('nvim_lsp')
local configs = require('nvim_lsp/configs')
local util = require('nvim_lsp/util')

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
--]]


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

nvim_lsp.pyls.setup{
  on_attach = on_attach,
  -- capabilities = lsp_status.capabilities
  settings = {
    pyls = {
      plugins = {
        jedi_completion = {
          fuzzy = true,
          include_params = true
        },
        mccabe = {
          enabled = false
        },
        pycodestyle = {
          enabled = false
        },
        flake8 = {
          enabled = true
        },
        pydocstyle = {
          enabled = false
        },
        pyflakes = {
          enabled = false
        },
        pylint = {
          enabled = false
        },
        yapf = {
          enabled = false
        }
      }
    }
  }
}


nvim_lsp.sumneko_lua.setup{
  on_attach = on_attach,
}
nvim_lsp.vimls.setup{
  on_attach = on_attach,
  -- capabilities = lsp_status.capabilities
}
nvim_lsp.tsserver.setup{
  on_attach = on_attach,
  -- capabilities = lsp_status.capabilities
}
nvim_lsp.html.setup{
  on_attach = on_attach,
  -- capabilities = lsp_status.capabilities
}
nvim_lsp.cssls.setup{
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

