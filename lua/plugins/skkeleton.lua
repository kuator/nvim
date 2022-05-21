-- https://vi.stackexchange.com/questions/8733/can-i-write-japanese-skk-text-in-vim
return {
    'vim-skk/skkeleton',
    opt = true,
    keys = { { 'i'; '<c-j>' } };
    requires ='vim-denops/denops.vim',
    wants ='denops.vim',
    config = function ()
      vim.cmd[[imap <silent> <C-j> <Plug>(skkeleton-toggle)]]
    end
}
