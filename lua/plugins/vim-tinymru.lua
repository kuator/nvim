--https://github.com/romainl/vim-tinyMRU/blob/master/doc/tinymru.txt
return function ()
  vim.o.wildcharm=26
  vim.api.nvim_set_keymap('n', '<leader>eo', ':ME <c-z>',{noremap=true})
end
