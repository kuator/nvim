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
  ["packer.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/packer.nvim"
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
  ["vim-exchange"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-exchange"
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
  ["vim-visual-multi"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/evakuator/.local/share/nvim/site/pack/packer/opt/vim-visual-multi"
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
-- Setup for: emmet-vim
        vim.g.user_emmet_mode = 'i'
        vim.g.user_emmet_leader_key = "<C-x>"
      
-- Setup for: vim-textobj-line
vim.g.textobj_line_no_default_key_mappings= true
-- Post-load configuration
-- Config for: space-vim-dark
loadstring("\27LJ\2\2—\3\0\0\2\0\t\0\0296\0\0\0009\0\1\0'\1\2\0B\0\2\0016\0\0\0009\0\1\0'\1\3\0B\0\2\0016\0\0\0009\0\1\0'\1\4\0B\0\2\0016\0\0\0009\0\1\0'\1\5\0B\0\2\0016\0\0\0009\0\1\0'\1\6\0B\0\2\0016\0\0\0009\0\1\0'\1\a\0B\0\2\0016\0\0\0009\0\1\0'\1\b\0B\0\2\1K\0\1\0'hi Comment cterm=italic gui=italic@hi LineNr guifg=white guibg=NONE ctermfg=white ctermbg=NONE,hi CursorLineNr ctermbg=NONE guibg=NONE*hi SignColumn ctermbg=NONE guibg=NONE*hi LineNr     ctermbg=NONE guibg=NONE*hi Normal     ctermbg=NONE guibg=NONE\31colorscheme space-vim-dark\bcmd\bvim\0")()
-- Config for: nvim-lspconfig
loadstring("\27LJ\2\2Ó\n\0\2\a\1,\0k-\2\0\0009\2\0\2\18\3\0\0\18\4\1\0B\2\3\0016\2\1\0009\2\2\0029\2\3\2'\3\4\0'\4\5\0'\5\6\0005\6\a\0B\2\5\0016\2\1\0009\2\2\0029\2\3\2'\3\4\0'\4\b\0'\5\t\0005\6\n\0B\2\5\0016\2\1\0009\2\2\0029\2\3\2'\3\4\0'\4\v\0'\5\f\0005\6\r\0B\2\5\0016\2\1\0009\2\2\0029\2\3\2'\3\4\0'\4\14\0'\5\15\0005\6\16\0B\2\5\0016\2\1\0009\2\2\0029\2\3\2'\3\4\0'\4\17\0'\5\18\0005\6\19\0B\2\5\0016\2\1\0009\2\2\0029\2\3\2'\3\4\0'\4\20\0'\5\21\0005\6\22\0B\2\5\0016\2\1\0009\2\2\0029\2\3\2'\3\4\0'\4\23\0'\5\24\0005\6\25\0B\2\5\0016\2\1\0009\2\2\0029\2\3\2'\3\4\0'\4\26\0'\5\27\0005\6\28\0B\2\5\0016\2\1\0009\2\2\0029\2\3\2'\3\4\0'\4\29\0'\5\30\0005\6\31\0B\2\5\0016\2\1\0009\2\2\0029\2\3\2'\3\4\0'\4 \0'\5!\0005\6\"\0B\2\5\0016\2\1\0009\2\2\0029\2\3\2'\3\4\0'\4#\0'\5$\0005\6%\0B\2\5\0016\2\1\0009\2\2\0029\2\3\2'\3\4\0'\4&\0'\5'\0005\6(\0B\2\5\0016\2\1\0009\2)\0029\2*\2'\3+\0B\2\2\1K\0\1\0\0À+setlocal omnifunc=lua.vim.lsp.omnifunc\17nvim_command\bapi\1\0\2\vsilent\2\fnoremap\2+<cmd>lua vim.lsp.buf.code_action()<CR>\n<a-.>\1\0\2\vsilent\2\fnoremap\2&<cmd>lua vim.lsp.buf.rename()<CR>\15<leader>rn\1\0\2\vsilent\2\fnoremap\0020<cmd>lua vim.lsp.buf.workspace_symbol()<CR>\15<leader>gw\1\0\2\vsilent\2\fnoremap\2/<cmd>lua vim.lsp.buf.document_symbol()<CR>\15<leader>gt\1\0\2\vsilent\2\fnoremap\2*<cmd>lua vim.lsp.buf.references()<CR>\15<leader>gr\1\0\2\vsilent\2\fnoremap\2/<cmd>lua vim.lsp.buf.type_definition()<CR>\15<leader>gy\1\0\2\vsilent\2\fnoremap\2.<cmd>lua vim.lsp.buf.signature_help()<CR>\n<c-k>\1\0\2\vsilent\2\fnoremap\2.<cmd>lua vim.lsp.buf.implementation()<CR>\15<leader>gi\1\0\2\vsilent\2\fnoremap\2*<cmd>lua vim.lsp.buf.formatting()<CR>\15<leader>gf\1\0\2\vsilent\2\fnoremap\2%<cmd>lua vim.lsp.buf.hover()<CR>\15<leader>gh\1\0\2\vsilent\2\fnoremap\2+<cmd>lua vim.lsp.buf.declaration()<CR>\15<leader>ge\1\0\2\vsilent\2\fnoremap\2*<cmd>lua vim.lsp.buf.definition()<CR>\15<leader>gd\6n\20nvim_set_keymap\afn\bvim\14on_attach’\1\0\1\5\0\a\1\23\18\1\0\0006\2\0\0009\2\1\2'\3\2\0B\2\2\2\15\0\2\0X\3\15€6\2\0\0009\2\1\2'\3\2\0B\2\2\2'\3\3\0\18\4\0\0&\2\4\0026\3\4\0009\3\5\0039\3\6\3\18\4\2\0B\3\2\2\t\3\0\0X\3\1€\18\1\2\0L\1\2\0\15executable\afn\bvim\n/bin/\16VIRTUAL_ENV\vgetenv\aos\2”\22\1\0\v\0|\0Ë\0016\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0023\2\3\0009\3\4\0019\3\5\0035\4\6\0=\2\a\0045\5\f\0005\6\v\0005\a\t\0005\b\b\0=\b\n\a=\a\1\6=\6\r\5=\5\14\0045\5\15\0=\5\16\4B\3\2\0019\3\17\0019\3\5\0035\4\18\0=\2\a\0045\5\19\0=\5\16\0045\5\23\0005\6\22\0005\a\21\0005\b\20\0=\b\n\a=\a\1\6=\6\r\5=\5\14\4B\3\2\0019\3\24\0019\3\5\0035\4\26\0005\5\25\0=\5\27\4=\2\a\0045\5\31\0005\6\30\0005\a\29\0005\b\28\0=\b\n\a=\a\1\6=\6\r\5=\5\14\0045\0050\0005\6!\0005\a \0=\a\1\0065\a\"\0=\a#\0065\a%\0005\b$\0=\b&\a=\a'\0065\a-\0004\b\0\b6\t(\0009\t)\t9\t*\t'\n+\0B\t\2\2+\n\2\0<\n\t\b6\t(\0009\t)\t9\t*\t'\n,\0B\t\2\2+\n\2\0<\n\t\b=\b.\a=\a/\6=\0061\5=\0052\4B\3\2\0019\0033\0019\3\5\0035\0044\0=\2\a\4B\3\2\0019\0035\0019\3\5\0035\0046\0=\2\a\4B\3\2\0019\0037\0019\3\5\0035\0049\0005\0058\0=\5\27\4=\2\a\0045\5=\0005\6<\0005\a;\0005\b:\0=\b\n\a=\a\1\6=\6\r\5=\5\14\4B\3\2\0019\3>\0019\3\5\0035\4@\0005\5?\0=\5\27\4=\2\a\0045\5B\0005\6A\0=\6C\0055\6D\0=\6E\0055\6F\0=\6G\5=\0052\0045\5K\0005\6J\0005\aI\0005\bH\0=\b\n\a=\a\1\6=\6\r\5=\5\14\4B\3\2\0019\3L\0019\3\5\0035\4M\0=\2\a\0045\5N\0005\6O\0=\6P\5=\5Q\4B\3\2\0013\3R\0009\4S\0019\4\5\0045\5U\0005\6T\0=\6P\0055\6p\0005\a`\0005\bW\0\18\t\3\0'\nV\0B\t\2\2=\tX\b5\tY\0=\tZ\b5\t[\0005\n\\\0>\n\2\t=\t]\b5\t^\0=\t_\b=\bV\a5\ba\0005\tb\0=\t_\b5\tc\0=\tZ\b5\td\0=\te\b5\tf\0=\tg\b=\bh\a5\bi\0005\tj\0=\t_\b5\tk\0=\tZ\b5\tl\0=\tg\b5\tm\0005\nn\0>\n\2\t=\t]\b=\bo\a=\aq\0065\ar\0=\aP\0065\au\0005\bs\0005\tt\0=\tZ\b=\bv\a=\aw\0065\ax\0=\ay\6=\6\16\5B\4\2\0019\4z\0019\4\5\0045\5{\0=\2\a\5B\4\2\0012\0\0€K\0\1\0\1\0\0\14angularls\20formatFiletypes\1\0\1\15javascript\rprettier\15formatters\rprettier\1\0\0\1\5\0\0\21--stdin-filepath\14%filepath\19--single-quote\22--print-width 120\1\0\1\fcommand!./node_modules/.bin/prettier\1\0\3\rmarkdown\17markdownlint\vpython\vflake8\15javascript\veslint\flinters\1\0\0\17markdownlint\1\0\3\fmessage\3\2\vcolumn\3ÿÿÿÿ\15\tline\3\1\1\2\0\0\22^.*:(\\d+)\\s+(.*)$\1\0\1\14undefined\thint\1\2\0\0\f--stdin\1\2\0\0\t.git\1\0\a\15offsetLine\3\0\rdebounce\3d\17offsetColumn\3\0\fcommand\17markdownlint\15sourceName\17markdownlint\risStderr\2\16formatLines\3\1\veslint\15securities\1\0\2\4\0€€€€\4\nerror\4\0€€Àÿ\3\fwarning\14parseJson\1\0\a\rsecurity\rseverity\fmessage\27${message} [${ruleId}]\fendLine\fendLine\14endColumn\14endColumn\15errorsRoot\17[0].messages\vcolumn\vcolumn\tline\tline\1\6\0\0\f--stdin\21--stdin-filename\14%filepath\r--format\tjson\1\2\0\0\t.git\1\0\3\15sourceName\veslint\rdebounce\3d\fcommand\31./node_modules/.bin/eslint\1\0\0\17rootPatterns\1\2\0\0\5\18formatPattern\1\0\3\fmessage\3\4\vcolumn\3\3\tline\3\1\1\2\0\0#^[^:]+:(\\d+):((\\d+):)?\\s+(.+)$\targs\1\4\0\0\25--stdin-display-name\14%filepath\6-\fcommand\1\0\3\15sourceName\vflake8\rdebounce\3ú\1\16formatLines\3\1\vflake8\1\0\0\1\4\0\0\15javascript\vpython\rmarkdown\17diagnosticls\0\ngodot\14filetypes\1\3\0\0\agd\rgdscript\1\0\2\tport\3ø.\thost\014127.0.0.1\1\0\0\rgdscript\1\0\0\1\0\0\1\0\0\1\0\1\19snippetSupport\2\tscss\1\0\1\rvalidate\2\tless\1\0\1\rvalidate\2\bcss\1\0\0\1\0\1\rvalidate\1\1\0\0\1\3\0\0\31vscode-css-language-server\f--stdio\ncssls\1\0\0\1\0\0\1\0\0\1\0\1\19snippetSupport\2\1\0\0\1\3\0\0 vscode-html-language-server\f--stdio\thtml\1\0\0\rtsserver\1\0\0\nvimls\rsettings\bLua\1\0\0\14workspace\flibrary\1\0\0\28$VIMRUNTIME/lua/vim/lsp\20$VIMRUNTIME/lua\vexpand\afn\bvim\16diagnostics\fglobals\1\0\0\1\3\0\0\bvim\buse\fruntime\1\0\1\fversion\vLuaJIT\1\0\0\1\0\1\16callSnippet\tBoth\1\0\0\1\0\0\1\0\0\1\0\1\19snippetSupport\2\bcmd\1\0\0\1\4\0\0h/home/evakuator/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/bin/Linux/lua-language-server\a-ET/home/evakuator/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/ma in.lua\16sumneko_lua\1\0\0\1\0\0\1\0\0\1\0\1\19snippetSupport\2\1\0\1\20disableSnippets\1\1\0\0\25jedi_language_server\17init_options\1\0\3\23completeUnimported\2\21clangdFileStatus\2\20usePlaceholders\2\17capabilities\17textDocument\1\0\0\1\0\0\19completionItem\1\0\0\1\0\1\19snippetSupport\2\14on_attach\1\0\0\nsetup\vclangd\0\14lspconfig\15completion\frequire\0")()
-- Config for: completion-nvim
loadstring("\27LJ\2\2\4\0\0\4\0\15\0\0296\0\0\0009\0\1\0004\1\4\0005\2\4\0005\3\3\0=\3\5\2>\2\1\0015\2\6\0>\2\2\0015\2\a\0>\2\3\1=\1\2\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\1\0+\1\2\0=\1\n\0006\0\0\0009\0\v\0'\1\f\0B\0\2\0016\0\0\0009\0\1\0005\1\14\0=\1\r\0K\0\1\0\1\0\14\14UltiSnips\3\1\vMethod\3\n\rFunction\3\a\tFile\3\0\nClass\3\5\15Interfaces\3\5\rConstant\3\5\nField\3\5\vModule\3\a\fBuffers\3\1\fKeyword\3\4\14Variables\3\a\14vim-vsnip\3\5\fTabNine\3\0\30completion_items_priority,let g:completion_confirm_key = \"\\<C-y>\"\bcmd$completion_matching_ignore_case\14vim-vsnip\30completion_enable_snippet\1\0\1\tmode\n<c-n>\1\0\1\tmode\n<c-p>\19complete_items\1\0\0\1\4\0\0\blsp\fsnippet\fbuffers#completion_chain_complete_list\6g\bvim\0")()
-- Config for: vim-vsnip
loadstring("\27LJ\2\2¼\4\0\0\5\0\24\0C6\0\0\0009\0\1\0006\1\0\0009\1\3\0019\1\4\1'\2\5\0B\1\2\2'\2\6\0&\1\2\1=\1\2\0006\0\0\0009\0\a\0009\0\b\0'\1\t\0'\2\n\0'\3\v\0005\4\f\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\1\r\0'\2\n\0'\3\v\0005\4\14\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\1\15\0'\2\n\0'\3\v\0005\4\16\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\1\t\0'\2\17\0'\3\18\0005\4\19\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\1\15\0'\2\17\0'\3\18\0005\4\20\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\1\r\0'\2\17\0'\3\18\0005\4\21\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\1\r\0'\2\22\0'\3\23\0004\4\0\0B\0\5\1K\0\1\0\27<Plug>(vsnip-cut-text)\n<C-h>\1\0\1\texpr\2\1\0\1\texpr\2\1\0\1\texpr\2Bvsnip#jumpable(-1) ? \"<Plug>(vsnip-jump-prev)\"      : \"<C-j>\"\n<C-j>\1\0\1\texpr\2\6x\1\0\1\texpr\2\6s\1\0\1\texpr\2Bvsnip#available(1) ? \"<Plug>(vsnip-expand-or-jump)\" : \"<C-k>\"\n<C-k>\6i\20nvim_set_keymap\bapi\14/snippets\vconfig\fstdpath\afn\22vsnip_snippet_dir\6g\bvim\0")()
-- Config for: nvim-treesitter
loadstring("\27LJ\2\2Ó\t\0\0\6\0-\00036\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0015\2\6\0005\3\a\0=\3\b\2=\2\t\0015\2\v\0005\3\n\0=\3\f\0025\3\r\0=\3\14\0025\3\15\0005\4\16\0=\4\b\3=\3\17\0025\3\18\0005\4\19\0=\4\b\3=\3\20\2=\2\21\0015\2\22\0005\3\23\0005\4\24\0005\5\25\0=\5\26\4=\4\b\3=\3\27\0025\3\28\0005\4\29\0=\4\30\0035\4\31\0=\4 \3=\3!\0025\3\"\0005\4#\0=\4$\0035\4%\0=\4&\0035\4'\0=\4(\0035\4)\0=\4*\3=\3+\2=\2,\1B\0\2\1K\0\1\0\16textobjects\tmove\22goto_previous_end\1\0\2\a[M\20@function.outer\a[]\17@class.outer\24goto_previous_start\1\0\2\a[m\20@function.outer\a[[\17@class.outer\18goto_next_end\1\0\2\a]M\20@function.outer\a][\17@class.outer\20goto_next_start\1\0\2\a]m\20@function.outer\a]]\17@class.outer\1\0\1\venable\2\tswap\18swap_previous\1\0\1\15<leader>ah\21@parameter.inner\14swap_next\1\0\1\15<leader>al\21@parameter.inner\1\0\1\venable\2\vselect\aiF\1\0\4\bcpp$(function_definition) @function\vpython$(function_definition) @function\tjava#(method_declaration) @function\6c$(function_definition) @function\1\0\4\aac\17@class.outer\aaf\20@function.outer\aif\20@function.inner\aic\17@class.inner\1\0\1\venable\2\1\0\1\venable\2\rrefactor\15navigation\1\0\2\21list_definitions\15<leader>tl\20goto_definition\15<leader>td\1\0\1\venable\2\17smart_rename\1\0\1\17smart_rename\15<leader>tr\1\0\1\venable\2\28highlight_current_scope\1\0\1\venable\2\26highlight_definitions\1\0\0\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\19init_selection\bgnn\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\1\0\1\venable\1\14highlight\1\0\1\21ensure_installed\ball\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0")()
-- Config for: vim-tinymru
loadstring("\27LJ\2\2‚\1\0\0\5\0\t\0\r6\0\0\0009\0\1\0)\1\26\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\1\5\0'\2\6\0'\3\a\0005\4\b\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\14:ME <c-z>\15<leader>eo\6n\20nvim_set_keymap\bapi\14wildcharm\6o\bvim\0")()
-- Config for: vim-gutentags
loadstring("\27LJ\2\2Ò\b\0\0\3\0\19\0-6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\1\0=\1\4\0006\0\0\0009\0\1\0005\1\6\0=\1\5\0006\0\0\0009\0\1\0006\1\0\0009\1\b\0019\1\t\1'\2\n\0B\1\2\2=\1\a\0006\0\0\0009\0\1\0+\1\2\0=\1\v\0006\0\0\0009\0\1\0+\1\2\0=\1\f\0006\0\0\0009\0\1\0+\1\2\0=\1\r\0006\0\0\0009\0\1\0+\1\2\0=\1\14\0006\0\0\0009\0\15\0'\1\16\0B\0\2\0016\0\0\0009\0\1\0005\1\18\0=\1\17\0K\0\1\0\1\3\0\0\23--tag-relative=yes\21--fields=+ailmnS\31gutentags_ctags_extra_args\\command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')\bcmd'gutentags_generate_on_empty_buffer gutentags_generate_on_write\"gutentags_generate_on_missing\30gutentags_generate_on_new\25~/.cache/nvim/ctags/\vexpand\afn\24gutentags_cache_dir\1\3\0\0\17package.json\t.git\27gutentags_project_root(gutentags_add_default_project_roots\1A\0\0\n*.git\n*.svg\t*.hg\14*/tests/*\nbuild\tdist\21*sites/*/files/*\bbin\17node_modules\21bower_components\ncache\rcompiled\tdocs\fexample\vbundle\vvendor\t*.md\16*-lock.json\v*.lock\16*bundle*.js\15*build*.js\n.*rc*\v*.json\f*.min.*\n*.map\n*.bak\n*.zip\n*.pyc\f*.class\n*.sln\r*.Master\r*.csproj\n*.tmp\18*.csproj.user\f*.cache\n*.pdb\ntags*\rcscope.*\n*.css\v*.less\v*.scss\n*.exe\n*.dll\n*.mp3\n*.ogg\v*.flac\n*.swp\n*.swo\n*.bmp\n*.gif\n*.ico\n*.jpg\n*.png\n*.rar\n*.zip\n*.tar\r*.tar.gz\r*.tar.xz\14*.tar.bz2\n*.pdf\n*.doc\v*.docx\n*.ppt\v*.pptx\28gutentags_ctags_exclude\6g\bvim\0")()
-- Conditional loads
-- Load plugins in order defined by `after`
END

function! s:load(names, cause) abort
call luaeval('_packer_load(_A[1], _A[2])', [a:names, a:cause])
endfunction


" Command lazy-loads
command! -nargs=* -range -bang -complete=file Tabularize call s:load(['tabular'], { "cmd": "Tabularize", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file EmmetInstall call s:load(['emmet-vim'], { "cmd": "EmmetInstall", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Emmet call s:load(['emmet-vim'], { "cmd": "Emmet", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })

" Keymap lazy-loads
xnoremap <silent> ar <cmd>call <SID>load(['vim-textobj-line'], { "keys": "ar", "prefix": "" })<cr>
xnoremap <silent> ir <cmd>call <SID>load(['vim-textobj-line'], { "keys": "ir", "prefix": "" })<cr>
onoremap <silent> ae <cmd>call <SID>load(['vim-textobj-entire'], { "keys": "ae", "prefix": "" })<cr>
inoremap <silent> <c-x>u <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>u" })<cr>
onoremap <silent> ie <cmd>call <SID>load(['vim-textobj-entire'], { "keys": "ie", "prefix": "" })<cr>
inoremap <silent> <c-x>; <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>;" })<cr>
vnoremap <silent> ae <cmd>call <SID>load(['vim-textobj-entire'], { "keys": "ae", "prefix": "" })<cr>
inoremap <silent> <c-x>, <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>," })<cr>
vnoremap <silent> ie <cmd>call <SID>load(['vim-textobj-entire'], { "keys": "ie", "prefix": "" })<cr>
nnoremap <silent> gcc <cmd>call <SID>load(['vim-commentary'], { "keys": "gcc", "prefix": "" })<cr>
inoremap <silent> <c-x>m <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>m" })<cr>
inoremap <silent> <c-x>A <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>A" })<cr>
inoremap <silent> <c-x>a <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>a" })<cr>
nnoremap <silent> gc <cmd>call <SID>load(['vim-commentary'], { "keys": "gc", "prefix": "" })<cr>
inoremap <silent> <c-x>k <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>k" })<cr>
inoremap <silent> <c-x>j <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>j" })<cr>
inoremap <silent> <c-x>d <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>d" })<cr>
inoremap <silent> <c-x>/ <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>/" })<cr>
inoremap <silent> <c-x>D <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>D" })<cr>
inoremap <silent> <c-x>I <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>I" })<cr>
inoremap <silent> <c-x>n <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>n" })<cr>
inoremap <silent> <c-x>i <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>i" })<cr>
inoremap <silent> <c-x>N <cmd>call <SID>load(['emmet-vim'], { "keys": "<c-x>N" })<cr>
onoremap <silent> ar <cmd>call <SID>load(['vim-textobj-line'], { "keys": "ar", "prefix": "" })<cr>
xnoremap <silent> gc <cmd>call <SID>load(['vim-commentary'], { "keys": "gc", "prefix": "" })<cr>
onoremap <silent> ir <cmd>call <SID>load(['vim-textobj-line'], { "keys": "ir", "prefix": "" })<cr>
onoremap <silent> gc <cmd>call <SID>load(['vim-commentary'], { "keys": "gc", "prefix": "" })<cr>

augroup packer_load_aucmds
  au!
  " Filetype lazy-loads
  " Event lazy-loads
augroup END
