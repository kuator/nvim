return {
    'lewis6991/impatient.nvim',
    config = function()
      local impatient = require('impatient')
      impatient.enable_profile()
    end
  }
