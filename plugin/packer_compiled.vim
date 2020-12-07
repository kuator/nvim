" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

lua << END
local plugins = {
  ["clean-path.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/clean-path.vim"
  },
  ["completion-buffers"] = {
    load_after = {
      ["completion-nvim"] = true
    },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/completion-buffers"
  },
  ["completion-nvim"] = {
    after = { "completion-buffers", "vim-vsnip", "vim-vsnip-integ" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/completion-nvim"
  },
  ["emmet-vim"] = {
    commands = { "Emmet", "EmmetInstall" },
    keys = { { "i", "<c-x>m" }, { "i", "<c-x>A" }, { "i", "<c-x>a" }, { "i", "<c-x>k" }, { "i", "<c-x>j" }, { "i", "<c-x>/" }, { "i", "<c-x>I" }, { "i", "<c-x>i" }, { "i", "<c-x>N" }, { "i", "<c-x>n" }, { "i", "<c-x>D" }, { "i", "<c-x>d" }, { "i", "<c-x>u" }, { "i", "<c-x>;" }, { "i", "<c-x>," } },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/emmet-vim"
  },
  ["nvim-colorizer.lua"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-lsp-bacomp"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/nvim-lsp-bacomp"
  },
  ["nvim-lsp-smag"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/nvim-lsp-smag"
  },
  ["nvim-lspconfig"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["packer.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/plenary.nvim"
  },
  ["popup.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/popup.nvim"
  },
  ["sideways.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/sideways.vim"
  },
  ["splitjoin.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/splitjoin.vim"
  },
  tabular = {
    commands = { "Tabularize" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/tabular"
  },
  ["tagalong.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/tagalong.vim"
  },
  ["telescope.nvim"] = {
    after = { "popup.nvim", "plenary.nvim" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["vim-commentary"] = {
    keys = { { "n", "gcc" }, { "x", "gc" }, { "o", "gc" }, { "n", "gc" } },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-commentary"
  },
  ["vim-exchange"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-exchange"
  },
  ["vim-repeat"] = {
    keys = { { "n", "." } },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-repeat"
  },
  ["vim-replacewithregister"] = {
    keys = { { "n", "gr" }, { "o", "grr" }, { "x", "gr" } },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-replacewithregister"
  },
  ["vim-rsi"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-rsi"
  },
  ["vim-smoothie"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-smoothie"
  },
  ["vim-sonictemplate"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-sonictemplate"
  },
  ["vim-surround"] = {
    keys = { { "n", "ys" }, { "x", "S" } },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-surround"
  },
  ["vim-textobj-entire"] = {
    after = { "vim-textobj-user" },
    keys = { { "o", "ae" }, { "o", "ie" }, { "v", "ae" }, { "v", "ie" } },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-textobj-entire"
  },
  ["vim-textobj-indent"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-textobj-indent"
  },
  ["vim-textobj-line"] = {
    keys = { { "o", "ar" }, { "o", "ir" }, { "v", "ar" }, { "v", "ir" } },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-textobj-line"
  },
  ["vim-textobj-user"] = {
    load_after = {
      ["vim-textobj-entire"] = true
    },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-textobj-user"
  },
  ["vim-textobj-variable-segment"] = {
    keys = { { "o", "av" }, { "o", "iv" }, { "v", "av" }, { "v", "iv" } },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-textobj-variable-segment"
  },
  ["vim-textobj-xmlattr"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-textobj-xmlattr"
  },
  ["vim-tinymru"] = {
    commands = { "ME" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-tinymru"
  },
  ["vim-visual-multi"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-visual-multi"
  },
  ["vim-vsnip"] = {
    load_after = {
      ["completion-nvim"] = true
    },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    load_after = {
      ["completion-nvim"] = true
    },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-vsnip-integ"
  },
  ["vista.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vista.vim"
  }
}

local function handle_bufread(names)
  for _, name in ipairs(names) do
    local path = plugins[name].path
    for _, dir in ipairs({ 'ftdetect', 'ftplugin', 'after/ftdetect', 'after/ftplugin' }) do
      if #vim.fn.finddir(dir, path) > 0 then
        vim.cmd('doautocmd BufRead')
        return
      end
    end
  end
end

_packer_load = nil

local function handle_after(name, before)
  local plugin = plugins[name]
  plugin.load_after[before] = nil
  if next(plugin.load_after) == nil then
    _packer_load({name}, {})
  end
end

_packer_load = function(names, cause)
  local some_unloaded = false
  for _, name in ipairs(names) do
    if not plugins[name].loaded then
      some_unloaded = true
      break
    end
  end

  if not some_unloaded then return end

  local fmt = string.format
  local del_cmds = {}
  local del_maps = {}
  for _, name in ipairs(names) do
    if plugins[name].commands then
      for _, cmd in ipairs(plugins[name].commands) do
        del_cmds[cmd] = true
      end
    end

    if plugins[name].keys then
      for _, key in ipairs(plugins[name].keys) do
        del_maps[key] = true
      end
    end
  end

  for cmd, _ in pairs(del_cmds) do
    vim.cmd('silent! delcommand ' .. cmd)
  end

  for key, _ in pairs(del_maps) do
    vim.cmd(fmt('silent! %sunmap %s', key[1], key[2]))
  end

  for _, name in ipairs(names) do
    if not plugins[name].loaded then
      vim.cmd('packadd ' .. name)
      if plugins[name].config then
        for _i, config_line in ipairs(plugins[name].config) do
          loadstring(config_line)()
        end
      end

      if plugins[name].after then
        for _, after_name in ipairs(plugins[name].after) do
          handle_after(after_name, name)
          vim.cmd('redraw')
        end
      end

      plugins[name].loaded = true
    end
  end

  handle_bufread(names)

  if cause.cmd then
    local lines = cause.l1 == cause.l2 and '' or (cause.l1 .. ',' .. cause.l2)
    vim.cmd(fmt('%s%s%s %s', lines, cause.cmd, cause.bang, cause.args))
  elseif cause.keys then
    local keys = cause.keys
    local extra = ''
    while true do
      local c = vim.fn.getchar(0)
      if c == 0 then break end
      extra = extra .. vim.fn.nr2char(c)
    end

    if cause.prefix then
      local prefix = vim.v.count and vim.v.count or ''
      prefix = prefix .. '"' .. vim.v.register .. cause.prefix
      if vim.fn.mode('full') == 'no' then
        if vim.v.operator == 'c' then
          prefix = '' .. prefix
        end

        prefix = prefix .. vim.v.operator
      end

      vim.fn.feedkeys(prefix, 'n')
    end

    -- NOTE: I'm not sure if the below substitution is correct; it might correspond to the literal
    -- characters \<Plug> rather than the special <Plug> key.
    vim.fn.feedkeys(string.gsub(string.gsub(cause.keys, '^<Plug>', '\\<Plug>') .. extra, '<[cC][rR]>', '\r'))
  elseif cause.event then
    vim.cmd(fmt('doautocmd <nomodeline> %s', cause.event))
  elseif cause.ft then
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeplugin', cause.ft))
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeindent', cause.ft))
  end
end

-- Runtimepath customization

-- Pre-load configuration
-- Post-load configuration
-- Conditional loads
-- Load plugins in order defined by `after`
END

function! s:load(names, cause) abort
call luaeval('_packer_load(_A[1], _A[2])', [a:names, a:cause])
endfunction


" Command lazy-loads
command! -nargs=* -range -bang -complete=file Emmet call s:load(['emmet-vim'], { "cmd": "Emmet", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file ME call s:load(['vim-tinymru'], { "cmd": "ME", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file EmmetInstall call s:load(['emmet-vim'], { "cmd": "EmmetInstall", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Tabularize call s:load(['tabular'], { "cmd": "Tabularize", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })

" Keymap lazy-loads
onoremap <silent> iv <cmd>call <SID>load(['vim-textobj-variable-segment'], { "keys": "iv", "prefix": "" })<cr>
vnoremap <silent> av <cmd>call <SID>load(['vim-textobj-variable-segment'], { "keys": "av", "prefix": "" })<cr>
vnoremap <silent> iv <cmd>call <SID>load(['vim-textobj-variable-segment'], { "keys": "iv", "prefix": "" })<cr>
nnoremap <silent> gc <cmd>call <SID>load(['vim-commentary'], { "keys": "gc", "prefix": "" })<cr>
onoremap <silent> gc <cmd>call <SID>load(['vim-commentary'], { "keys": "gc", "prefix": "" })<cr>
onoremap <silent> ae <cmd>call <SID>load(['vim-textobj-entire'], { "keys": "ae", "prefix": "" })<cr>
inoremap <silent> <c-x>u <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>u" })<cr>
onoremap <silent> ie <cmd>call <SID>load(['vim-textobj-entire'], { "keys": "ie", "prefix": "" })<cr>
inoremap <silent> <c-x>; <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>;" })<cr>
vnoremap <silent> ae <cmd>call <SID>load(['vim-textobj-entire'], { "keys": "ae", "prefix": "" })<cr>
inoremap <silent> <c-x>, <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>," })<cr>
vnoremap <silent> ie <cmd>call <SID>load(['vim-textobj-entire'], { "keys": "ie", "prefix": "" })<cr>
inoremap <silent> <c-x>A <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>A" })<cr>
inoremap <silent> <c-x>a <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>a" })<cr>
inoremap <silent> <c-x>k <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>k" })<cr>
inoremap <silent> <c-x>j <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>j" })<cr>
inoremap <silent> <c-x>/ <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>/" })<cr>
nnoremap <silent> gr <cmd>call <SID>load(['vim-replacewithregister'], { "keys": "gr", "prefix": "" })<cr>
inoremap <silent> <c-x>I <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>I" })<cr>
onoremap <silent> grr <cmd>call <SID>load(['vim-replacewithregister'], { "keys": "grr", "prefix": "" })<cr>
inoremap <silent> <c-x>i <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>i" })<cr>
xnoremap <silent> gr <cmd>call <SID>load(['vim-replacewithregister'], { "keys": "gr", "prefix": "" })<cr>
inoremap <silent> <c-x>N <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>N" })<cr>
inoremap <silent> <c-x>n <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>n" })<cr>
inoremap <silent> <c-x>D <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>D" })<cr>
xnoremap <silent> gc <cmd>call <SID>load(['vim-commentary'], { "keys": "gc", "prefix": "" })<cr>
nnoremap <silent> gcc <cmd>call <SID>load(['vim-commentary'], { "keys": "gcc", "prefix": "" })<cr>
nnoremap <silent> ys <cmd>call <SID>load(['vim-surround'], { "keys": "ys", "prefix": "" })<cr>
nnoremap <silent> . <cmd>call <SID>load(['vim-repeat'], { "keys": ".", "prefix": "" })<cr>
xnoremap <silent> S <cmd>call <SID>load(['vim-surround'], { "keys": "S", "prefix": "" })<cr>
vnoremap <silent> ir <cmd>call <SID>load(['vim-textobj-line'], { "keys": "ir", "prefix": "" })<cr>
vnoremap <silent> ar <cmd>call <SID>load(['vim-textobj-line'], { "keys": "ar", "prefix": "" })<cr>
onoremap <silent> ir <cmd>call <SID>load(['vim-textobj-line'], { "keys": "ir", "prefix": "" })<cr>
onoremap <silent> ar <cmd>call <SID>load(['vim-textobj-line'], { "keys": "ar", "prefix": "" })<cr>
inoremap <silent> <c-x>d <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>d" })<cr>
inoremap <silent> <c-x>m <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>m" })<cr>
onoremap <silent> av <cmd>call <SID>load(['vim-textobj-variable-segment'], { "keys": "av", "prefix": "" })<cr>

augroup packer_load_aucmds
  au!
  " Filetype lazy-loads
  " Event lazy-loads
  au InsertEnter * ++once call s:load(['vim-rsi', 'telescope.nvim'], { "event": "InsertEnter *" })
augroup END
