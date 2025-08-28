-- Highlight on yank
-- https://oroques.dev/notes/neovim-init/
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank( { timeout = 150 })
  end,
  group = highlight_group,
  pattern = '*',
})

-- https://www.reddit.com/r/vim/comments/bmh977/automatically_open_quickfix_window_after/
vim.api.nvim_create_autocmd('QuickFixCmdPost', {
  command = 'cwindow',
  pattern = '[^l]*',
})

vim.api.nvim_create_autocmd('QuickFixCmdPost', {
  command = 'lwindow',
  pattern = 'l*',
})

vim.api.nvim_create_autocmd('FileType', {
  callback = function ()
    vim.opt.formatoptions:remove('c')
    vim.opt.formatoptions:remove('r')
    vim.opt.formatoptions:remove('o')
  end,
  pattern = '*',
})

vim.api.nvim_create_autocmd('FileType', {
  command = 'set bufhidden=delete',
  pattern = 'gitcommit,gitrebase,gitconfig',
})


local lspattach = vim.api.nvim_create_augroup("LspAttach", { clear = true })
vim.api.nvim_create_autocmd({ "LspAttach" }, {
    group = lspattach,
    callback = function(ev)
        local options = { noremap = true, silent = true }
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local bufnr = ev.buf

        -- vim.keymap.set("n", "<space>gf", function()
        --   vim.lsp.buf.format({ async = false })
        -- end, options)
        -- vim.keymap.set("v", "<space>gf", function()
        --   vim.lsp.buf.format({ async = false })
        -- end, options)

        -- vim.keymap.set("n", "<leader>gk",  vim.lsp.buf.signature_help, options)

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, options)

        -- vim.keymap.set("n", "<leader>ge", vim.lsp.buf.declaration, options)
        -- vim.keymap.set("n", "<leader>gh", vim.lsp.buf.hover, options)
        -- vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, options)
        -- vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, options)
        -- vim.keymap.set("n", "<leader>gy", vim.lsp.buf.type_definition, options)
        -- vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, options)
        -- vim.keymap.set("n", "<leader>gt", vim.lsp.buf.document_symbol, options)
        -- vim.keymap.set("n", "<leader>gw", vim.lsp.buf.workspace_symbol, options)
        -- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, options)
        -- vim.keymap.set("n", "<a-.>", vim.lsp.buf.code_action, options)

        local function format_servers(server)
          local servers_to_ignore = { "ruff", "tsserver", "lua_ls", "jdtls", "vue_ls" }

          if servers_to_ignore[server] then
            return false
          else
            return true
          end
        end

        if client and client:supports_method("textDocument/formatting") then
          vim.keymap.set("n", "<leader>F", function()
            vim.lsp.buf.format({
              filter = function(client_)
                return format_servers(client_.name)
              end,
              bufnr = bufnr,
              timeout_ms = 2000,
            })
          end, { buffer = bufnr })
        end

        if client then
          client.server_capabilities.semanticTokensProvider = nil
        end

    end
})

-- https://www.reddit.com/r/neovim/comments/165irku/comment/jye7a4v/
vim.api.nvim_create_autocmd({'BufWritePre', 'FileWritePre'}, {
  pattern = '*',
  command = [[if @% !~# '\(://\)' | call mkdir(expand('<afile>:p:h'), 'p') | endif]]
})

