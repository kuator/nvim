
" create pull request to nvim-lsp
"https://code.woboq.org/llvm/clang-tools-extra/clangd/Protocol.h.html#409

lua << EOF
  require'nvim_lsp'.sumneko_lua.setup{}
  require'nvim_lsp'.html.setup{}
  require'nvim_lsp'.cssls.setup{}
  require'nvim_lsp'.vimls.setup{}
  require'nvim_lsp'.tsserver.setup{on_attach=require'completion'.on_attach}
  require'nvim_lsp'.clangd.setup{
    on_attach=require'completion'.on_attach,
    capabilities = {
       textDocument = {
         completion = {
          completionItem = {
            snippetSupport=true
          }
         }
       }
    }
  }

  require'nvim_lsp'.pyls.setup {
    on_attach=require'completion'.on_attach,
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

function! SetMappings() abort
  nnoremap <silent> <leader>gd <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <silent> <leader>gi    <cmd>lua vim.lsp.buf.implementation()<CR>
  nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
  nnoremap <silent> <leader>gy   <cmd>lua vim.lsp.buf.type_definition()<CR>
  nnoremap <silent> <leader>gr    <cmd>lua vim.lsp.buf.references()<CR>
  set omnifunc=v:lua.vim.lsp.omnifunc
endfunction


augroup tex_mappings
    autocmd!
    autocmd FileType cpp,python,javascript,javascriptreact,typescript,typescriptreact,vim,lua call SetMappings()
augroup END
