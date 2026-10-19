if vim.fn.executable("rg") == 0 then
  return
end

local command = { "rg", "--vimgrep", "--no-heading", "--hidden", "--smart-case" }
local ignore_file = vim.fs.joinpath(vim.fn.stdpath("config"), "..", "fd", "ignore")
if vim.fn.filereadable(ignore_file) == 1 then
  vim.list_extend(command, { "--ignore-file", vim.fn.shellescape(ignore_file) })
end

vim.o.grepprg = table.concat(command, " ")
vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m"
vim.keymap.set("n", "<leader>lg", ":silent lgrep ", { desc = "Search into location list" })
