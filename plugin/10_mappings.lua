-- clear highlights
----------------------------------
-- vim.keymap.set("n", "<C-l>", function()
--   vim.cmd("nohlsearch")       -- clear search highlight
--   vim.cmd("redraw")           -- same as <C-l> in normal mode
--   vim.cmd("echo ''")
-- end, { desc = "Redraw screen and clear search highlight", silent = true })

-- list files in the current directory
vim.keymap.set('n', '<leader>ec', [[:edit <C-r>=fnameescape(expand('%:p:h')).'/*'<CR>]])
-- list files in the neovim config
vim.keymap.set('n', '<leader>en', [[:edit <C-r>=fnameescape(stdpath('config')).'/**/*'<CR>]])

-- use fdfind with grep
vim.keymap.set('n', '<leader>lf', [[:lexpr system('fdfind --hidden --no-ignore-vcs -g "*"')<left><left><left><left>]])

-- https://vi.stackexchange.com/a/2682
vim.keymap.set('n', '<a-j>', [[:m .+1<CR>==]])
vim.keymap.set('n', '<a-k>', [[:m .-2<CR>==]])
vim.keymap.set('i', '<a-j>', [[<Esc>:m .+1<CR>==gi]])
vim.keymap.set('i', '<a-k>', [[<Esc>:m .-2<CR>==gi]])
vim.keymap.set('x', '<a-j>', [[:m '>+1<CR>gv=gv]])
vim.keymap.set('x', '<a-k>', [[:m '<-2<CR>gv=gv]])

-- change cwd
vim.keymap.set('n', 'cd', ':lcd %:p:h<bar>pwd<cr>', { silent = true })
vim.keymap.set('n', 'cu', ':lcd ..<bar>pwd<cr>', { silent = true })

-- exit terminal
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])
vim.keymap.set('t', '<c-q>', [[<C-\><C-n>]])

-- disable s
vim.keymap.set('n', 's', '<nop>')

-- remove snippet placeholder
vim.keymap.set('s', '<c-h>', '<c-h>i')

-- ctags
vim.keymap.set('n', '<leader>lt', ':ltag /')

vim.keymap.set('n', '<a-c>', ':')
vim.keymap.set('v', '<a-c>', ':')

vim.keymap.set('i', 'kj', '<esc>')
vim.keymap.set('n', '<leader>gg', ':qa<cr>')

-- close quickfix and loclist
vim.keymap.set('n', '<leader>cc', function()
  vim.cmd('cclose')
  vim.cmd('lclose')
end, { desc = 'Close quickfix and location list', silent = true })
 
-- dealing with buffers
local wildcharm = vim.o.wildcharm
vim.api.nvim_set_keymap("n", "gb", ":buffer " .. string.char(wildcharm), { noremap = true, silent = false })

local function start_dev_terminals(namespace, chat_command)
  require("config.lazy").load({ "overseer.nvim" }, "config.overseer")
  local overseer = require("overseer")

  local function run(name, command)
    overseer.new_task({
      name = name,
      cmd = "zsh",
      args = { "-ic", command },
      strategy = "jobstart",
      metadata = { devterminals = true },
      components = {
        "default",
      },
    }):start()
  end

  run("backend",
    ('cd "$(zoxide query backend)" && mise exec -- uv run uvicorn %s.server:app --port 8100 --reload --reload-dir %s --reload-dir core'):format(namespace, namespace)
  )

  run("mcp",
    ('cd "$(zoxide query mcp)" && mise exec -- uv run python -m %s.src.server.app'):format(namespace)
  )

  run("client-service",
    ('cd "$(zoxide query client_service)" && mise exec -- uv run uvicorn %s.src.main:app --host 0.0.0.0 --port 8000 --reload --reload-dir %s --reload-dir core'):format(namespace, namespace)
  )

  run("worker",
    ('cd "$(zoxide query worker)" && mise exec -- uv run celery -A app.%s.main.celery_app worker --loglevel=info --concurrency=${CELERY_CONCURRENCY:-2} --max-tasks-per-child=1'):format(namespace)
  )

  run("chat",
    'cd "$(zoxide query chat)" && ' .. chat_command
  )
end

vim.api.nvim_create_user_command("DevTerminalsInternal", function()
  start_dev_terminals("internal", "npm run dev")
end, {})

vim.api.nvim_create_user_command("DevTerminalsExternal", function()
  start_dev_terminals("external", "npm run dev:aks")
end, {})

vim.api.nvim_create_user_command("DevTerminalsStop", function()
  require("config.lazy").load({ "overseer.nvim" }, "config.overseer")
  local overseer = require("overseer")

  local tasks = overseer.list_tasks({
    filter = function(task)
      return task.metadata.devterminals == true
    end,
  })

  for _, task in ipairs(tasks) do
    if task:stop() then
      task:dispose(true)
    end
  end
end, {})
