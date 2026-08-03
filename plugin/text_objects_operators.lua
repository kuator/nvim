local packages = {
  "vim-textobj-user",
  "targets.vim",
  "vim-textobj-entire",
  "treesitter-indent-object.nvim",
  "vim-textobj-variable-segment",
  "dsf.vim",
  "ts-comments.nvim",
  "vim-textobj-line",
}

vim.g.dsf_no_mappings = 1

vim.pack.add({
  "https://github.com/kana/vim-textobj-user",
  "https://github.com/wellle/targets.vim",
  "https://github.com/kana/vim-textobj-entire",
  "https://github.com/kiyoon/treesitter-indent-object.nvim",
  "https://github.com/Julian/vim-textobj-variable-segment",
  "https://github.com/AndrewRadev/dsf.vim",
  "https://github.com/folke/ts-comments.nvim",
  "https://github.com/kana/vim-textobj-line",
}, { load = false, confirm = false })

local lazy = require("config.lazy")
local function load()
  lazy.load(packages, "config.text_objects_operators")
end

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { "*:no*", "*:v", "*:V", "*:\22" },
  once = true,
  callback = load,
})

local mappings = {
  dsf = "<Plug>DsfDelete",
  csf = "<Plug>DsfChange",
  dsnf = "<Plug>DsfNextDelete",
  csnf = "<Plug>DsfNextChange",
}

for lhs, rhs in pairs(mappings) do
  vim.keymap.set({ "n", "x" }, lhs, function()
    load()
    return rhs
  end, { expr = true, remap = true })
end
