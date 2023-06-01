local keymap_opts = { noremap = true, silent = true }

local keymap_wo_wk = function()
  -- Without which-key
  vim.api.nvim_set_keymap(
    "n",
    "scs",
    [[<cmd>lua require('cscope_maps').cscope_prompt('s', vim.fn.expand("<cword>"))<cr>]],
    keymap_opts
  )
  vim.api.nvim_set_keymap(
    "n",
    "scg",
    [[<cmd>lua require('cscope_maps').cscope_prompt('g', vim.fn.expand("<cword>"))<cr>]],
    keymap_opts
  )
  vim.api.nvim_set_keymap(
    "n",
    "scc",
    [[<cmd>lua require('cscope_maps').cscope_prompt('c', vim.fn.expand("<cword>"))<cr>]],
    keymap_opts
  )
  vim.api.nvim_set_keymap(
    "n",
    "sct",
    [[<cmd>lua require('cscope_maps').cscope_prompt('t', vim.fn.expand("<cword>"))<cr>]],
    keymap_opts
  )
  vim.api.nvim_set_keymap(
    "n",
    "sce",
    [[<cmd>lua require('cscope_maps').cscope_prompt('e', vim.fn.expand("<cword>"))<cr>]],
    keymap_opts
  )
  vim.api.nvim_set_keymap(
    "n",
    "scf",
    [[<cmd>lua require('cscope_maps').cscope_prompt('f', vim.fn.expand("<cfile>"))<cr>]],
    keymap_opts
  )
  vim.api.nvim_set_keymap(
    "n",
    "sci",
    [[<cmd>lua require('cscope_maps').cscope_prompt('i', vim.fn.expand("<cfile>"))<cr>]],
    keymap_opts
  )
  vim.api.nvim_set_keymap(
    "n",
    "scd",
    [[<cmd>lua require('cscope_maps').cscope_prompt('d', vim.fn.expand("<cword>"))<cr>]],
    keymap_opts
  )
  vim.api.nvim_set_keymap(
    "n",
    "sca",
    [[<cmd>lua require('cscope_maps').cscope_prompt('a', vim.fn.expand("<cword>"))<cr>]],
    keymap_opts
  )
  vim.api.nvim_set_keymap("n", "scb", [[<cmd>Cscope build<cr>]], keymap_opts)
end

local function config()
  keymap_wo_wk()
  require("cscope_maps").setup({
    disable_maps = true,
    cscope = {
      use_telescope = true, -- true will show results in telescope picker
    }
  })
end


return {
  "dhananjaylatkar/cscope_maps.nvim",
  dependencies = {
    "folke/which-key.nvim",
    "telescope.nvim"
  },
  event = { "BufReadPre", "BufNewFile" },
  config = config,
}
