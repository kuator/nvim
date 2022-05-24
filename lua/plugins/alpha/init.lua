return {
  'goolord/alpha-nvim',
  config = function ()
    require'alpha'.setup(
      require('plugins.alpha.themes.dashboard').config
    )
  end
}
