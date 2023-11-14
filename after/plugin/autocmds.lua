-- Highlight on yank
-- https://oroques.dev/notes/neovim-init/
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
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
  -- command = 'set fo-=c fo-=r fo-=o',
  callback = function ()
    vim.opt.formatoptions:remove('c')
    vim.opt.formatoptions:remove('r')
    vim.opt.formatoptions:remove('o')
  end,
  pattern = '*',
})

vim.api.nvim_create_autocmd('TermOpen', {
  command = 'setlocal nonumber norelativenumber | setlocal signcolumn=no ',
  pattern = '*',
})

vim.api.nvim_create_autocmd('FileType', {
  command = 'set bufhidden=delete',
  pattern = 'gitcommit,gitrebase,gitconfig',
})


vim.api.nvim_create_autocmd('CmdwinEnter', {
  command = 'nnoremap <buffer> <c-g> <c-w>q',
  pattern = '*',
})

vim.api.nvim_create_autocmd('FileType', {
  command = 'nnoremap <esc> <c-w>q',
  pattern = 'lazy,neotest-summary',
})

vim.api.nvim_create_autocmd('FileType', {
  command = 'nnoremap q <c-w>q',
  pattern = 'lazy,neotest-summary',
})

local lspattach = vim.api.nvim_create_augroup("LspAttach", { clear = true })

vim.api.nvim_create_autocmd({ "LspAttach" }, {
    group = lspattach,
    callback = function(args)
        local on_attach = require('utils').on_attach
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        -- client.server_capabilities.semanticTokensProvider = nil
        on_attach(client, bufnr)
    end
})

-- vim.api.nvim_create_autocmd('LspAttach', {
--     callback = function(args)
--         vim.bo[args.buf].formatexpr = "v:lua.vim.lsp.formatexpr(#{timeout_ms:5000})"
--     end,
-- })









-- local patches_path = vim.fn.stdpath('config') .. '/patch/'
-- local plugins_path = vim.fn.stdpath 'data' .. '/lazy/'
-- local agLazyPatches = vim.api.nvim_create_augroup('LazyPatches', {})
--
-- vim.api.nvim_create_autocmd('User', {
--     pattern = { 'LazyInstallPre', 'LazyUpdatePre' },
-- 	group = agLazyPatches,
-- 	callback = function()
-- 		for patch in vim.fs.dir(patches_path) do
-- 			local patch_path = patches_path .. patch
-- 			local plugin_path = plugins_path .. patch:gsub('%.patch$', '')
-- 			if vim.loop.fs_stat(plugin_path) then
-- 				vim.notify('Lazy: reverting patch ' .. patch)
-- 				local sh_out = vim.fn.system {
-- 					'git', '-C', plugin_path,
-- 					'apply', '--reverse', '--ignore-space-change',
-- 					patch_path,
-- 				}
-- 				if vim.v.shell_error ~= 0 then
-- 					vim.notify('Failed to reverse ' .. patch .. ':\n' .. sh_out, vim.log.levels.WARN)
-- 				end
-- 			end
-- 		end
-- 	end,
-- 	desc = 'Reverse local patches when installing plugins.',
-- })
--
-- vim.api.nvim_create_autocmd('User', {
--     pattern = { 'LazyInstall', 'LazyUpdate' },
-- 	group = agLazyPatches,
-- 	callback = function()
-- 		for patch in vim.fs.dir(patches_path) do
-- 			local patch_path = patches_path .. patch
-- 			local plugin_path = plugins_path .. patch:gsub('%.patch$', '')
-- 			if vim.loop.fs_stat(plugin_path) then
-- 				vim.notify('Lazy: applying patch ' .. patch)
-- 				local sh_out = vim.fn.system {
-- 					'git', '-C', plugin_path,
-- 					'apply', '--ignore-space-change',
-- 					patch_path,
-- 				}
-- 				if vim.v.shell_error ~= 0 then
-- 					vim.notify('Failed to apply ' .. patch .. ':\n' .. sh_out, vim.log.levels.WARN)
-- 				end
-- 			end
-- 		end
-- 	end,
-- 	desc = 'Apply local patches when installing plugins.',
-- })
