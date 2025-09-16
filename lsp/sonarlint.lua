return {
  server = {
    cmd = {
      "sonarlint-language-server",
      -- Ensure that sonarlint-language-server uses stdio channel
      "-stdio",
      "-analyzers",
      -- paths to the analyzers you need, using those for python and java in this example
      vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
      vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
      vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
    },
  },
  filetypes = {
    -- Tested and working
    "cs",
    "dockerfile",
    "python",
    "cpp",
    "java",
  },
}
