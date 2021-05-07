return function ()
  vim.g.indent_blankline_char = "┊"
  vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
  vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile'}
  vim.g.indent_blankline_char_highlight = 'LineNr'
end
