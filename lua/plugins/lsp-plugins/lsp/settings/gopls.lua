return {
  -- for postfix snippets and analyzers
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      usePlaceholders = true,
      analyses = {
        unreachable = true,
        unusedparams = true,
        nilness = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
}
