if vim.g.vscode then
  return
end


vim.pack.add({ "https://github.com/lukas-reineke/indent-blankline.nvim"}, {load=true})

local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowTeal",
  "RainbowGreen",
  "RainbowOrange",
  "RainbowCyan",
}

local hooks = require("ibl.hooks")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#ea6962" })
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#fabd2f" })
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#458588" })
  vim.api.nvim_set_hl(0, "RainbowTeal", { fg = "#8ec07c" })
  vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#b8bb26" })
  vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#e78a4e" })
  vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#83a598" })
end)

require("ibl").setup({
  indent = { char = "▎", tab_char = "│" },
  scope = {
    enabled = true,
    show_start = true,
    show_end = true,
    show_exact_scope = true,
    highlight = highlight,
  },
  exclude = { filetypes = { "startify", "dashboard", "help", "NvimTree", "lazy", "mason" } },
})
