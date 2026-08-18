require("codecompanion").setup({
  adapters = {
    acp = {
      codex = function()
        return require("codecompanion.adapters").extend("codex", {
          defaults = {
            auth_method = "chat-gpt",
          },
        })
      end,
    },
  },
  interactions = {
    chat = {
      adapter = "codex",
    },
  },
})
