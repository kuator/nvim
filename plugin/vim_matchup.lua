vim.g.matchup_surround_enabled = 1
vim.g.matchup_matchparen_nomode = "i"
vim.g.matchup_matchparen_deferred = 1
vim.g.matchup_matchparen_deferred_show_delay = 400
vim.g.matchup_matchparen_deferred_hide_delay = 400
vim.g.matchup_matchparen_offscreen = { method = "popup" }

vim.pack.add({ "https://github.com/andymass/vim-matchup" }, { load = false, confirm = false })

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    if vim.bo[args.buf].buftype ~= "" then
      return
    end
    require("config.lazy").load({ "vim-matchup" }, "config.vim_matchup")
    return true
  end,
})
