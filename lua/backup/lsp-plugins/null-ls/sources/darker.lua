local h = require("null-ls.helpers")
local formatting = require("null-ls.methods").internal.FORMATTING

return h.make_builtin({
  name = "darker",
  meta = {
    url = "https://github.com/akaihola/darker",
    description = "Reformat and lint modified Python code",
  },
  method = formatting,
  filetypes = { "python" },
  generator_opts = {
    command = "darker",
    args = {
      "--quiet",
      "--stdout",
      "$FILENAME",
    },
    to_stdin = true,
  },
  factory = h.formatter_factory,
})
