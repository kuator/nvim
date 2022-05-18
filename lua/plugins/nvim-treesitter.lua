return {
  'nvim-treesitter/nvim-treesitter',
  opt = true,
  config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = { "python", "lua"}, 
      highlight = { enable = false },
    }
  end
}
