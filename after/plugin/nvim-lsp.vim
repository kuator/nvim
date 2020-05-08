if has('nvim')
  packadd nvim-lsp


lua << EOF
  require'nvim_lsp'.sumneko_lua.setup{}
  require'nvim_lsp'.html.setup{}
  require'nvim_lsp'.cssls.setup{}
  require'nvim_lsp'.vimls.setup{}
  require'nvim_lsp'.tsserver.setup{}
  require'nvim_lsp'.clangd.setup{}

  require'nvim_lsp'.pyls.setup {
    settings = {
      pyls = {
        plugins = {
          mccabe = {
              enabled = false
          },
          pycodestyle = {
              enabled = false
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
EOF
endif
