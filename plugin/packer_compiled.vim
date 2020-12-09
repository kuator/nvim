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
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/completion-buffers"
  },
  ["emmet-vim"] = {
    commands = { "Emmet", "EmmetInstall" },
    keys = { { "i", "<c-x>m" }, { "i", "<c-x>A" }, { "i", "<c-x>a" }, { "i", "<c-x>k" }, { "i", "<c-x>j" }, { "i", "<c-x>/" }, { "i", "<c-x>I" }, { "i", "<c-x>i" }, { "i", "<c-x>N" }, { "i", "<c-x>n" }, { "i", "<c-x>D" }, { "i", "<c-x>d" }, { "i", "<c-x>u" }, { "i", "<c-x>;" }, { "i", "<c-x>," } },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/emmet-vim"
  },
  ["html5.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/html5.vim"
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
  ["python-syntax"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/python-syntax"
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
    commands = { "Telescope" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["vim-UnconditionalPaste"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-UnconditionalPaste"
  },
  ["vim-commentary"] = {
    keys = { { "n", "gcc" }, { "x", "gc" }, { "o", "gc" }, { "n", "gc" } },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-commentary"
  },
  ["vim-cpp-modern"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-cpp-modern"
  },
  ["vim-css3-syntax"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-css3-syntax"
  },
  ["vim-exchange"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-exchange"
  },
  ["vim-glsl"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-glsl"
  },
  ["vim-godot"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-godot"
  },
  ["vim-javascript"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-javascript"
  },
  ["vim-jsx-pretty"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-jsx-pretty"
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
  ["vim-textobj-entire"] = {
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
    config = { "\27LJ\2\2Û\1\0\0\5\0\t\0!6\0\0\0009\0\1\0009\0\2\0'\1\3\0'\2\4\0'\3\5\0004\4\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\1\6\0'\2\4\0'\3\5\0004\4\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\1\3\0'\2\a\0'\3\b\0004\4\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\1\6\0'\2\a\0'\3\b\0004\4\0\0B\0\5\1K\0\1\0\27<Plug>(textobj-line-a)\aar\6x\27<Plug>(textobj-line-i)\air\6o\20nvim_set_keymap\bapi\bvim\0" },
    keys = { { "o", "ar" }, { "o", "ir" }, { "x", "ar" }, { "x", "ir" } },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-textobj-line"
  },
  ["vim-textobj-variable-segment"] = {
    keys = { { "o", "av" }, { "o", "iv" }, { "v", "av" }, { "v", "iv" } },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-textobj-variable-segment"
  },
  ["vim-textobj-xmlattr"] = {
    keys = { { "o", "ax" }, { "o", "ix" }, { "v", "ax" }, { "v", "ix" } },
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
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
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
  },
  ["yats.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/yats.vim"
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
-- Config for: nvim-lspconfig
loadstring("\27LJ\2\2Ó\n\0\2\a\1,\0k-\2\0\0009\2\0\2\18\3\0\0\18\4\1\0B\2\3\0016\2\1\0009\2\2\0029\2\3\2'\3\4\0'\4\5\0'\5\6\0005\6\a\0B\2\5\0016\2\1\0009\2\2\0029\2\3\2'\3\4\0'\4\b\0'\5\t\0005\6\n\0B\2\5\0016\2\1\0009\2\2\0029\2\3\2'\3\4\0'\4\v\0'\5\f\0005\6\r\0B\2\5\0016\2\1\0009\2\2\0029\2\3\2'\3\4\0'\4\14\0'\5\15\0005\6\16\0B\2\5\0016\2\1\0009\2\2\0029\2\3\2'\3\4\0'\4\17\0'\5\18\0005\6\19\0B\2\5\0016\2\1\0009\2\2\0029\2\3\2'\3\4\0'\4\20\0'\5\21\0005\6\22\0B\2\5\0016\2\1\0009\2\2\0029\2\3\2'\3\4\0'\4\23\0'\5\24\0005\6\25\0B\2\5\0016\2\1\0009\2\2\0029\2\3\2'\3\4\0'\4\26\0'\5\27\0005\6\28\0B\2\5\0016\2\1\0009\2\2\0029\2\3\2'\3\4\0'\4\29\0'\5\30\0005\6\31\0B\2\5\0016\2\1\0009\2\2\0029\2\3\2'\3\4\0'\4 \0'\5!\0005\6\"\0B\2\5\0016\2\1\0009\2\2\0029\2\3\2'\3\4\0'\4#\0'\5$\0005\6%\0B\2\5\0016\2\1\0009\2\2\0029\2\3\2'\3\4\0'\4&\0'\5'\0005\6(\0B\2\5\0016\2\1\0009\2)\0029\2*\2'\3+\0B\2\2\1K\0\1\0\0À+setlocal omnifunc=lua.vim.lsp.omnifunc\17nvim_command\bapi\1\0\2\vsilent\2\fnoremap\2+<cmd>lua vim.lsp.buf.code_action()<CR>\n<a-.>\1\0\2\vsilent\2\fnoremap\2&<cmd>lua vim.lsp.buf.rename()<CR>\15<leader>rn\1\0\2\vsilent\2\fnoremap\0020<cmd>lua vim.lsp.buf.workspace_symbol()<CR>\15<leader>gw\1\0\2\vsilent\2\fnoremap\2/<cmd>lua vim.lsp.buf.document_symbol()<CR>\15<leader>gt\1\0\2\vsilent\2\fnoremap\2*<cmd>lua vim.lsp.buf.references()<CR>\15<leader>gr\1\0\2\vsilent\2\fnoremap\2/<cmd>lua vim.lsp.buf.type_definition()<CR>\15<leader>gy\1\0\2\vsilent\2\fnoremap\2.<cmd>lua vim.lsp.buf.signature_help()<CR>\n<c-k>\1\0\2\vsilent\2\fnoremap\2.<cmd>lua vim.lsp.buf.implementation()<CR>\15<leader>gi\1\0\2\vsilent\2\fnoremap\2*<cmd>lua vim.lsp.buf.formatting()<CR>\15<leader>gf\1\0\2\vsilent\2\fnoremap\2%<cmd>lua vim.lsp.buf.hover()<CR>\15<leader>gh\1\0\2\vsilent\2\fnoremap\2+<cmd>lua vim.lsp.buf.declaration()<CR>\15<leader>ge\1\0\2\vsilent\2\fnoremap\2*<cmd>lua vim.lsp.buf.definition()<CR>\15<leader>gd\6n\20nvim_set_keymap\afn\bvim\14on_attach’\1\0\1\5\0\a\1\23\18\1\0\0006\2\0\0009\2\1\2'\3\2\0B\2\2\2\15\0\2\0X\3\15€6\2\0\0009\2\1\2'\3\2\0B\2\2\2'\3\3\0\18\4\0\0&\2\4\0026\3\4\0009\3\5\0039\3\6\3\18\4\2\0B\3\2\2\t\3\0\0X\3\1€\18\1\2\0L\1\2\0\15executable\afn\bvim\n/bin/\16VIRTUAL_ENV\vgetenv\aos\2¬\20\1\0\v\0n\0³\0016\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0023\2\3\0009\3\4\0019\3\5\0035\4\6\0=\2\a\0045\5\f\0005\6\v\0005\a\t\0005\b\b\0=\b\n\a=\a\1\6=\6\r\5=\5\14\0045\5\15\0=\5\16\4B\3\2\0019\3\17\0019\3\5\0035\4\18\0=\2\a\0045\5\19\0=\5\16\0045\5\23\0005\6\22\0005\a\21\0005\b\20\0=\b\n\a=\a\1\6=\6\r\5=\5\14\4B\3\2\0019\3\24\0019\3\5\0035\4\26\0005\5\25\0=\5\27\4=\2\a\0045\5\31\0005\6\30\0005\a\29\0005\b\28\0=\b\n\a=\a\1\6=\6\r\5=\5\14\0045\5\"\0005\6!\0005\a \0=\a\1\6=\6#\5=\5$\4B\3\2\0019\3%\0019\3\5\0035\4&\0=\2\a\4B\3\2\0019\3'\0019\3\5\0035\4(\0=\2\a\4B\3\2\0019\3)\0019\3\5\0035\4+\0005\5*\0=\5\27\4=\2\a\0045\5/\0005\6.\0005\a-\0005\b,\0=\b\n\a=\a\1\6=\6\r\5=\5\14\4B\3\2\0019\0030\0019\3\5\0035\0042\0005\0051\0=\5\27\4=\2\a\0045\0054\0005\0063\0=\0065\0055\0066\0=\0067\0055\0068\0=\0069\5=\5$\0045\5=\0005\6<\0005\a;\0005\b:\0=\b\n\a=\a\1\6=\6\r\5=\5\14\4B\3\2\0019\3>\0019\3\5\0035\4?\0=\2\a\0045\5@\0005\6A\0=\6B\5=\5C\4B\3\2\0013\3D\0009\4E\0019\4\5\0045\5G\0005\6F\0=\6B\0055\6b\0005\aR\0005\bI\0\18\t\3\0'\nH\0B\t\2\2=\tJ\b5\tK\0=\tL\b5\tM\0005\nN\0>\n\2\t=\tO\b5\tP\0=\tQ\b=\bH\a5\bS\0005\tT\0=\tQ\b5\tU\0=\tL\b5\tV\0=\tW\b5\tX\0=\tY\b=\bZ\a5\b[\0005\t\\\0=\tQ\b5\t]\0=\tL\b5\t^\0=\tY\b5\t_\0005\n`\0>\n\2\t=\tO\b=\ba\a=\ac\0065\ad\0=\aB\0065\ag\0005\be\0005\tf\0=\tL\b=\bh\a=\ai\0065\aj\0=\ak\6=\6\16\5B\4\2\0019\4l\0019\4\5\0045\5m\0=\2\a\5B\4\2\0012\0\0€K\0\1\0\1\0\0\14angularls\20formatFiletypes\1\0\1\15javascript\rprettier\15formatters\rprettier\1\0\0\1\5\0\0\21--stdin-filepath\14%filepath\19--single-quote\22--print-width 120\1\0\1\fcommand!./node_modules/.bin/prettier\1\0\3\rmarkdown\17markdownlint\vpython\vflake8\15javascript\veslint\flinters\1\0\0\17markdownlint\1\0\3\fmessage\3\2\vcolumn\3ÿÿÿÿ\15\tline\3\1\1\2\0\0\22^.*:(\\d+)\\s+(.*)$\1\0\1\14undefined\thint\1\2\0\0\f--stdin\1\2\0\0\t.git\1\0\a\15offsetLine\3\0\rdebounce\3d\17offsetColumn\3\0\fcommand\17markdownlint\15sourceName\17markdownlint\risStderr\2\16formatLines\3\1\veslint\15securities\1\0\2\4\0€€€€\4\nerror\4\0€€Àÿ\3\fwarning\14parseJson\1\0\a\rsecurity\rseverity\fmessage\27${message} [${ruleId}]\fendLine\fendLine\14endColumn\14endColumn\15errorsRoot\17[0].messages\vcolumn\vcolumn\tline\tline\1\6\0\0\f--stdin\21--stdin-filename\14%filepath\r--format\tjson\1\2\0\0\t.git\1\0\3\15sourceName\veslint\rdebounce\3d\fcommand\31./node_modules/.bin/eslint\1\0\0\17rootPatterns\1\2\0\0\5\18formatPattern\1\0\3\fmessage\3\4\vcolumn\3\3\tline\3\1\1\2\0\0#^[^:]+:(\\d+):((\\d+):)?\\s+(.+)$\targs\1\4\0\0\25--stdin-display-name\14%filepath\6-\fcommand\1\0\3\15sourceName\vflake8\rdebounce\3ú\1\16formatLines\3\1\vflake8\1\0\0\1\4\0\0\15javascript\vpython\rmarkdown\17diagnosticls\0\ngodot\14filetypes\1\3\0\0\agd\rgdscript\1\0\2\tport\3ø.\thost\014127.0.0.1\1\0\0\rgdscript\1\0\0\1\0\0\1\0\0\1\0\1\19snippetSupport\2\tscss\1\0\1\rvalidate\2\tless\1\0\1\rvalidate\2\bcss\1\0\0\1\0\1\rvalidate\1\1\0\0\1\3\0\0\31vscode-css-language-server\f--stdio\ncssls\1\0\0\1\0\0\1\0\0\1\0\1\19snippetSupport\2\1\0\0\1\3\0\0 vscode-html-language-server\f--stdio\thtml\1\0\0\rtsserver\1\0\0\nvimls\rsettings\bLua\1\0\0\1\0\0\1\0\1\16callSnippet\tBoth\1\0\0\1\0\0\1\0\0\1\0\1\19snippetSupport\2\bcmd\1\0\0\1\4\0\0h/home/evakuator/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/bin/Linux/lua-language-server\a-ET/home/evakuator/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/ma in.lua\16sumneko_lua\1\0\0\1\0\0\1\0\0\1\0\1\19snippetSupport\2\1\0\1\20disableSnippets\1\1\0\0\25jedi_language_server\17init_options\1\0\3\23completeUnimported\2\21clangdFileStatus\2\20usePlaceholders\2\17capabilities\17textDocument\1\0\0\1\0\0\19completionItem\1\0\0\1\0\1\19snippetSupport\2\14on_attach\1\0\0\nsetup\vclangd\0\14lspconfig\15completion\frequire\0")()
-- Conditional loads
-- Load plugins in order defined by `after`
END

function! s:load(names, cause) abort
call luaeval('_packer_load(_A[1], _A[2])', [a:names, a:cause])
endfunction


" Command lazy-loads
command! -nargs=* -range -bang -complete=file Telescope call s:load(['telescope.nvim'], { "cmd": "Telescope", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Tabularize call s:load(['tabular'], { "cmd": "Tabularize", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file ME call s:load(['vim-tinymru'], { "cmd": "ME", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file EmmetInstall call s:load(['emmet-vim'], { "cmd": "EmmetInstall", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Emmet call s:load(['emmet-vim'], { "cmd": "Emmet", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })

" Keymap lazy-loads
xnoremap <silent> ir <cmd>call <SID>load(['vim-textobj-line'], { "keys": "ir", "prefix": "" })<cr>
nnoremap <silent> gc <cmd>call <SID>load(['vim-commentary'], { "keys": "gc", "prefix": "" })<cr>
nnoremap <silent> . <cmd>call <SID>load(['vim-repeat'], { "keys": ".", "prefix": "" })<cr>
nnoremap <silent> gr <cmd>call <SID>load(['vim-replacewithregister'], { "keys": "gr", "prefix": "" })<cr>
onoremap <silent> grr <cmd>call <SID>load(['vim-replacewithregister'], { "keys": "grr", "prefix": "" })<cr>
xnoremap <silent> gr <cmd>call <SID>load(['vim-replacewithregister'], { "keys": "gr", "prefix": "" })<cr>
inoremap <silent> <c-x>m <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>m" })<cr>
inoremap <silent> <c-x>A <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>A" })<cr>
inoremap <silent> <c-x>a <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>a" })<cr>
inoremap <silent> <c-x>k <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>k" })<cr>
onoremap <silent> av <cmd>call <SID>load(['vim-textobj-variable-segment'], { "keys": "av", "prefix": "" })<cr>
inoremap <silent> <c-x>j <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>j" })<cr>
onoremap <silent> iv <cmd>call <SID>load(['vim-textobj-variable-segment'], { "keys": "iv", "prefix": "" })<cr>
inoremap <silent> <c-x>/ <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>/" })<cr>
vnoremap <silent> av <cmd>call <SID>load(['vim-textobj-variable-segment'], { "keys": "av", "prefix": "" })<cr>
inoremap <silent> <c-x>I <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>I" })<cr>
vnoremap <silent> iv <cmd>call <SID>load(['vim-textobj-variable-segment'], { "keys": "iv", "prefix": "" })<cr>
inoremap <silent> <c-x>i <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>i" })<cr>
inoremap <silent> <c-x>N <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>N" })<cr>
inoremap <silent> <c-x>n <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>n" })<cr>
vnoremap <silent> ix <cmd>call <SID>load(['vim-textobj-xmlattr'], { "keys": "ix", "prefix": "" })<cr>
inoremap <silent> <c-x>D <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>D" })<cr>
vnoremap <silent> ax <cmd>call <SID>load(['vim-textobj-xmlattr'], { "keys": "ax", "prefix": "" })<cr>
inoremap <silent> <c-x>d <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>d" })<cr>
onoremap <silent> ix <cmd>call <SID>load(['vim-textobj-xmlattr'], { "keys": "ix", "prefix": "" })<cr>
inoremap <silent> <c-x>u <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>u" })<cr>
onoremap <silent> ax <cmd>call <SID>load(['vim-textobj-xmlattr'], { "keys": "ax", "prefix": "" })<cr>
inoremap <silent> <c-x>; <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>;" })<cr>
vnoremap <silent> ie <cmd>call <SID>load(['vim-textobj-entire'], { "keys": "ie", "prefix": "" })<cr>
inoremap <silent> <c-x>, <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>," })<cr>
vnoremap <silent> ae <cmd>call <SID>load(['vim-textobj-entire'], { "keys": "ae", "prefix": "" })<cr>
onoremap <silent> ie <cmd>call <SID>load(['vim-textobj-entire'], { "keys": "ie", "prefix": "" })<cr>
onoremap <silent> ae <cmd>call <SID>load(['vim-textobj-entire'], { "keys": "ae", "prefix": "" })<cr>
onoremap <silent> ar <cmd>call <SID>load(['vim-textobj-line'], { "keys": "ar", "prefix": "" })<cr>
nnoremap <silent> gcc <cmd>call <SID>load(['vim-commentary'], { "keys": "gcc", "prefix": "" })<cr>
onoremap <silent> ir <cmd>call <SID>load(['vim-textobj-line'], { "keys": "ir", "prefix": "" })<cr>
xnoremap <silent> gc <cmd>call <SID>load(['vim-commentary'], { "keys": "gc", "prefix": "" })<cr>
xnoremap <silent> ar <cmd>call <SID>load(['vim-textobj-line'], { "keys": "ar", "prefix": "" })<cr>
onoremap <silent> gc <cmd>call <SID>load(['vim-commentary'], { "keys": "gc", "prefix": "" })<cr>

augroup packer_load_aucmds
  au!
  " Filetype lazy-loads
  au FileType gdscript ++once call s:load(['vim-godot'], { "ft": "gdscript" })
  au FileType typescript ++once call s:load(['yats.vim'], { "ft": "typescript" })
  au FileType glsl ++once call s:load(['vim-glsl'], { "ft": "glsl" })
  au FileType javascript.jsx ++once call s:load(['vim-jsx-pretty'], { "ft": "javascript.jsx" })
  au FileType javascriptreact ++once call s:load(['vim-jsx-pretty'], { "ft": "javascriptreact" })
  au FileType javascript ++once call s:load(['vim-javascript', 'vim-jsx-pretty'], { "ft": "javascript" })
  au FileType css ++once call s:load(['vim-css3-syntax'], { "ft": "css" })
  au FileType html ++once call s:load(['html5.vim'], { "ft": "html" })
  au FileType typescriptreact ++once call s:load(['yats.vim', 'vim-jsx-pretty'], { "ft": "typescriptreact" })
  au FileType cpp ++once call s:load(['vim-cpp-modern'], { "ft": "cpp" })
  au FileType typescript.tsx ++once call s:load(['yats.vim', 'vim-jsx-pretty'], { "ft": "typescript.tsx" })
  au FileType python ++once call s:load(['python-syntax'], { "ft": "python" })
  " Event lazy-loads
  au InsertEnter * ++once call s:load(['vim-rsi'], { "event": "InsertEnter *" })
augroup END
