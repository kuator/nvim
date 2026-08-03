vim.g.rainbow_delimiters = { blacklist = { "lua" } }

local file = vim.fn.tempname() .. ".lua"
vim.fn.writefile({ "return {}" }, file)
vim.cmd.edit(vim.fn.fnameescape(file))

local attached = require("rainbow-delimiters.lib").buffers[vim.api.nvim_get_current_buf()]
vim.fn.delete(file)
assert(not attached, "rainbow-delimiters attached to a blacklisted buffer")
vim.cmd("qa!")
