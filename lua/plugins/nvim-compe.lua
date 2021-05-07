return function ()
  vim.o.completeopt = "menuone,noselect"
  require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;

    source = {
      path = true;
      buffer = true;
      calc = true;
      vsnip = true;
      nvim_lsp = true;
      nvim_lua = true;
      spell = true;
      tags = true;
      snippets_nvim = true;
      treesitter = true;
    };
  }
  -- vim.cmd [[inoremap <silent><expr> <CR>      compe#confirm('<CR>')]]
  vim.cmd [[inoremap <silent><expr> <C-y>      compe#confirm('<CR>')]]
  vim.cmd [[inoremap <silent><expr> <C-e>     compe#close('<C-e>')]]

  -- if completion_item.kind == vim.lsp.protocol.CompletionItemKind['Method'] or completion_item.kind == vim.lsp.protocol.CompletionItemKind['Method'] then
  --   completion_item.insertTextFormat = 2
  --   completion_item.insertText = completion_item.label.."($1)$0";
  -- end
  local Helper = require "compe.helper"
  Helper.convert_lsp_orig = Helper.convert_lsp
  Helper.convert_lsp = function(args)
    local response = args.response or {}
    local items = response.items or response
    for _, item in ipairs(items) do
      -- 2: method
      -- 3: function
      -- 4: constructor
      if item.insertText == nil and (item.kind == 2 or item.kind == 3 or item.kind == 4) then
        item.insertText = item.label .. "(${1})"
        item.insertTextFormat = 2
      end
    end
    return Helper.convert_lsp_orig(args)
  end
end
