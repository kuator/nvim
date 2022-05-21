return {
    'lewis6991/gitsigns.nvim', wants = {'plenary.nvim'} ,
    event = 'BufRead',
    opt=true,
    config = function() require'gitsigns'.setup() end
}
