vim.pack.add({ "https://github.com/kjuq/skkelua.nvim" }, { load = true, confirm = false })

local dictionary = vim.fs.joinpath(vim.fn.stdpath("data"), "skk", "SKK-JISYO.L")

require("skkelua").config({
  globalDictionaries = { dictionary },
  completion = {
    enabled = true,
    insertOnSelect = false,
  },
  indicator = {
    enabled = true,
    alwaysShown = false,
    border = "rounded",
  },
})

-- Usage:
--   1. In Insert mode, press <C-6> to enable SKK.
--   2. Type lowercase romaji for hiragana: "nihongo" -> "にほんご".
--   3. Start a word with an uppercase letter to request kanji conversion:
--      "Nihongo" -> "▽にほんご".
--   4. Press Space to convert/select the next candidate, Enter to confirm,
--      x for the previous candidate, or <C-g> to cancel conversion.
--   5. Press <C-6> again to disable SKK.
--   6. In Normal mode, <leader>tj toggles persistent mode, which enables SKK
--      automatically whenever Insert mode starts.
--
-- <C-j> is not used because it is already mapped to backward LuaSnip jumps.
vim.keymap.set("i", "<C-6>", "<Plug>(skkelua-toggle)", { desc = "Toggle Japanese input" })
vim.keymap.set("n", "<leader>tj", "<Plug>(skkelua-persistent-toggle)", { desc = "Toggle persistent Japanese input" })
