return {
  'LunarVim/darkplus.nvim',
  config = function ()
    -- vim.g.transparent_background = true        -- transparent background(Default: false)
    -- vim.g.italic_comments = true               -- italic comments(Default: true)
    -- vim.g.italic_keywords = true               -- italic keywords(Default: true)
    -- vim.g.italic_functions = true              -- italic functions(Default: false)
    -- vim.g.italic_variables = true              -- italic variables(Default: false)
    vim.cmd[[colorscheme darkplus]]
    -- https://stackoverflow.com/a/6230504
    vim.cmd[[highlight iCursor guifg=white guibg=steelblue]]
    vim.cmd[[highlight Cursor guifg=black guibg=white]]
    vim.cmd[[set guicursor=n-v-c:block-Cursor]]
    vim.cmd[[set guicursor+=i:ver100-iCursor]]
    vim.cmd[[hi CursorLine cterm=underline guibg=#333333]]
  end
}
