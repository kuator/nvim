local diagnostic_signs = {
    [vim.diagnostic.severity.ERROR] = "",
    [vim.diagnostic.severity.WARN] = "",
    [vim.diagnostic.severity.INFO] = "",
    [vim.diagnostic.severity.HINT] = "󰌵",
}

local shorter_source_names = {
    ["Lua Diagnostics."] = "Lua",
    ["Lua Syntax Check."] = "Lua",
}

local function diagnostic_format(diagnostic)
    return string.format(
        "%s %s (%s): %s",
        diagnostic_signs[diagnostic.severity],
        shorter_source_names[diagnostic.source] or diagnostic.source,
        diagnostic.code,
        diagnostic.message
    )
end

vim.diagnostic.config({
    virtual_text = {
        spacing = 4,
        prefix = "",
        format = diagnostic_format,
        current_line = true
    },
    signs = {
        text = diagnostic_signs,
    },
    underline = true,
    severity_sort = true,
})
