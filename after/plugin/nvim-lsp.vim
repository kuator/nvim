if has('nvim')
  packadd nvim-lsp
  lua require'nvim_lsp'.tsserver.setup{}
lua << EOF
  require'nvim_lsp'.pyls.setup{
  settings = {pyls = {
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

