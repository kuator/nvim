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
end
