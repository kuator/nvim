return { 
  'https://github.com/junegunn/vim-after-object',
  config = function ()
    vim.cmd("call after_object#enable([']', '['], '=', ':', '-', '#', ' ')")
  end
}
