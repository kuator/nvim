return {
  'linux-cultist/venv-selector.nvim',
  config = function()
    require('venv-selector').setup {}
  end,
  cmd = {'VenvSelect', 'VenvSelectCached'}
}
