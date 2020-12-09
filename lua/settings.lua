local g = vim.g
local o = vim.o
local bo = vim.bo
local wo = vim.wo
local cmd = vim.cmd
local exec = vim.api.nvim_exec
local fn = vim.fn
local api = vim.api

cmd('filetype plugin indent on')

g.mapleader = ' '

o.hidden = true

wo.number = true
o.number = true
wo.relativenumber = true
o.relativenumber = true

o.clipboard = 'unnamedplus'
o.updatetime=100

wo.wrap = false
o.wrap = false

o.expandtab = true
o.shiftwidth = 2
-- when 'sts' is negative, the value of 'shiftwidth' is used.
o.softtabstop = -1
o.autoindent = true

--searching
o.incsearch = true
o.hlsearch = true
o.ignorecase = true
o.smartcase = true

o.splitbelow = true
o.splitright = true
o.signcolumn = 'yes'

-- https://stackoverflow.com/a/25102964
o.shortmess = o.shortmess .. 'c'

o.swapfile = true
o.directory = fn.expand(fn.stdpath('data') .. '/swap//')
o.backup = true
o.backupcopy = 'yes'
o.backupdir = fn.expand(fn.stdpath('data') .. '/backup//')
o.undofile = true
o.undodir = fn.expand(fn.stdpath('data') .. '/undo//')

if fn.isdirectory(o.directory) == 0 then fn.mkdir(o.directory, 'p') end
if fn.isdirectory(o.backupdir) == 0 then fn.mkdir(o.backupdir, 'p') end
if fn.isdirectory(o.undodir) == 0 then fn.mkdir(o.undodir, 'p') end


-- vim.api.nvim_set_keymap('n', '<a-c>', ':', {})
-- vim.api.nvim_set_keymap('i', 'kj', '<esc>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<c-l>', '<c-l>:nohls<cr>', {noremap=true, silent=true})

-- interactive substitute
o.inccommand = 'split'

local wildignored = {
    "tags",
    "*/__pycache__/*",
    "build/*",
    "build.?/*",
    "*/node_modules/*",
    "*/env/*",
    "*.png",
    "*.jpg",
    "*.jpeg",
    "*/migrations/*",
    "*/.git/*"
}

local wildignore = ''
for i=1,#wildignored do
  wildignore = wildignore .. wildignored[i] .. ','
end

o.wildignore = wildignore

-- https://github.com/justinmk/config/blob/master/.config/nvim/init.vim#L1238
local suffixesed = {
    ".aux",
    ".log",
    ".dvi",
    ".bbl",
    ".blg",
    ".brf",
    ".cb",
    ".ind",
    ".idx",
    ".ilg",
    ".inx",
    ".out",
    ".toc",
    ".o",
    ".obj",
    ".dll",
    ".class",
    ".pyc",
    ".ipynb",
    ".so",
    ".swp",
    ".zip",
    ".exe",
    ".jar",
    ".gz"
}

local suffixes = ''
for i=1,#suffixesed do
  suffixes = suffixes .. suffixesed[i] .. ','
end

o.suffixes = suffixes

o.wildignorecase = true
--wildcharm requires integer for the character, 26 is ascii code for 'c-z'
o.wildcharm=26
o.wildmenu=true
o.wildmode='longest:full,full'

-- scroll margins
-- pretty comfortable when using zz and zt
o.scrolloff=3      
o.sidescrolloff=3

if fn.executable("rg") then
    o.grepprg="rg --vimgrep --no-heading --smart-case --no-ignore-vcs --ignore-file ~/.config/.ignore"
    o.grepformat='%f:%l:%c:%m,%f:%l:%m'
end

-- make vim not select match in popup
-- and not insert text from match
-- and open menu even if there is only one match
o.completeopt="menuone,noinsert,noselect"

-- https://vim.fandom.com/wiki/Search_only_in_unfolded_text
-- set fdo-=search


-- python providers for neovim
g.python_host_prog='/opt/.venvs/neovim2/bin/python'
g.python3_host_prog='/opt/.venvs/neovim3/bin/python'



o.path = o.path:gsub([[/usr/include]], '')
o.path = o.path .. fn.stdpath('config') .. '/**'


function nvim_create_augroups(definitions)
        for group_name, definition in pairs(definitions) do
                api.nvim_command('augroup '..group_name)
                api.nvim_command('autocmd!')
                for _, def in ipairs(definition) do
                        -- if type(def) == 'table' and type(def[#def]) == 'function' then
                        -- 	def[#def] = lua_callback(def[#def])
                        -- end
                        local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
                        api.nvim_command(command)
                end
                api.nvim_command('augroup END')
        end
end

local autocmds = {
        highlight_yank = {
                {"TextYankPost",     "*",   "silent! lua require'vim.highlight'.on_yank{'IncSearch', 200}"};
        };
        -- https://vi.stackexchange.com/a/1985
        no_comment_on_new_line = {
          {'FileType', '*', 'set fo-=c fo-=r fo-=o'};
        },
        open_quickfix_window = {
          {'QuickFixCmdPost', '[^l]*', 'cwindow'};
        };
        -- https://superuser.com/questions/604122/vim-file-name-completion-relative-to-current-file
        file_completion = {
          {'InsertEnter', '*', "let save_cwd = getcwd() | execute 'lcd' expand('%:p:h')"},
          {'InsertLeave', '*', "execute 'lcd' fnameescape(save_cwd)"}
        }
}

nvim_create_augroups(autocmds)

-- for searching files with location list
o.errorformat = o.errorformat .. ',%f'



