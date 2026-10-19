if vim.g.vscode then
  return
end

vim.pack.add({
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
}, { load = false, confirm = false })

local status = { fg = "#FFFFFF", bg = "#007ACC" }
local theme = {
  normal = { a = status, b = status, c = status },
}

for _, mode in ipairs({ "insert", "visual", "replace", "command", "terminal", "inactive" }) do
  theme[mode] = theme.normal
end

local function lsp_status()
  local names = vim.tbl_map(function(client)
    return client.name
  end, vim.lsp.get_clients({ bufnr = 0 }))

  if #names == 0 then
    return "No LSP"
  end

  table.sort(names)
  return "LSP: " .. table.concat(names, ", ")
end

require("minibuffer.integrations.lualine")({
  options = {
    component_separators = "",
    section_separators = "",
    globalstatus = true,
    theme = theme,
  },
  sections = {
    lualine_a = { { "mode", color = { gui = "bold" } } },
    lualine_b = {
      { "branch", icon = "" },
      {
        "diagnostics",
        colored = true,
        diagnostics_color = {
          error = { fg = "#FF5555", bg = "#007ACC", gui = "bold" },
          warn  = { fg = "#FFD700", bg = "#007ACC", gui = "bold" },
          info  = { fg = "#55FFFF", bg = "#007ACC", gui = "bold" },
          hint  = { fg = "#ffffff", bg = "#007ACC", gui = "bold" },
        },
        symbols = {
          error = " ",
          warn  = " ",
          info  = " ",
          hint  = "󰌵 ",
        },
      },
    },
    lualine_c = { "filename" },
    lualine_x = { lsp_status },
    lualine_y = { "location", "progress" },
    lualine_z = {
      { "encoding", fmt = string.upper },
      { "fileformat", fmt = string.upper },
    },
  },
})
