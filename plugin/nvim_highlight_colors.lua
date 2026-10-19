vim.pack.add({ "https://github.com/brenoprata10/nvim-highlight-colors" }, { load = true, confirm = false })

require("nvim-highlight-colors").setup({
	render = "virtual",
	virtual_symbol = "■",
	virtual_symbol_position = "inline",
	virtual_symbol_suffix = " ",
	exclude_buftypes = { "nofile", "prompt", "terminal" },
})
