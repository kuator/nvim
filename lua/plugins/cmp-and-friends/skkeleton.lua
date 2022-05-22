-- https://vi.stackexchange.com/questions/8733/can-i-write-japanese-skk-text-in-vim
return {
    'vim-skk/skkeleton',
    opt = true,
    keys = { { 'i'; '<c-s>' } };
    requires ={ 'vim-denops/denops.vim', 'rinx/cmp-skkeleton'},
    wants = {'denops.vim', 'cmp-skkeleton'},
    config = function ()
      vim.cmd[[imap <silent> <c-s> <Plug>(skkeleton-toggle)]]
    end
}
