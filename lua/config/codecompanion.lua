require("config.codecompanion_fidget").setup()

require("codecompanion").setup({
  adapters = {
    acp = {
      codex = function()
        return require("codecompanion.adapters").extend("codex", {
          -- Use the installed CLI instead of codex-acp's older bundled Codex.
          env = {
            CODEX_PATH = function()
              local path = vim.fn.exepath("codex")
              assert(path ~= "", "Codex executable was not found in PATH")
              return path
            end,
          },
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
