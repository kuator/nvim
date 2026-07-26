# Focused Neovim Configuration Cleanup Design

## Goal

Fix the verified configuration errors, remove explicitly unwanted integrations, and initialize the retained testing, debugging, and indentation plugins without broad unrelated cleanup.

## Correctness fixes

- Rename `lsp/yaml.lua` to `lsp/yamlls.lua` so the enabled `yamlls` configuration receives SchemaStore settings.
- Rename `lsp/emmet_ls.lua` to `lsp/emmet_language_server.lua` so the enabled Emmet server receives the custom filetypes.
- Set the Tree-sitter `indentexpr` inside the existing matching `FileType` callback so it applies to each supported buffer.
- Assign `vim.env.EDITOR = vim.env.VISUAL` instead of the literal string `$VISUAL`.
- Correct the `<leader>lf` ignore-file path to `$XDG_CONFIG_HOME/.ignore`.

## Removed integrations

- Remove Neo-tree and its explicit `nui.nvim` dependency.
- Remove Blink Edit.
- Remove the disabled `lua_ls` configuration; `emmylua_ls` remains the configured Lua server.
- Remove the disabled SonarLint LSP configuration and its mason-null-ls installation entry.
- Remove only corresponding stale lockfile entries while preserving unrelated lockfile changes.

## Initialized integrations

- Add `nvim-neotest/neotest-python` and initialize Neotest with its default Python adapter, supporting pytest and unittest.
- Explicitly initialize `nvim-dap-view` with its default configuration.
- Initialize GuessIndent with its default configuration.

## Preservation constraints

- Keep Oil and `netrw.nvim`.
- Keep Checkstyle with `-c /google_checks.xml`; this is Checkstyle's bundled classpath resource.
- Keep `nvim-jdtls` and the native `vim.lsp.enable("jdtls")` path.
- Do not remove generated documentation, comment-only files, other optional plugins, or perform the broader audit refactors.
- Do not rewrite unrelated existing worktree or lockfile changes.

## Verification

- Before editing, structural checks must demonstrate the incorrect LSP filenames, buffer-local Tree-sitter assignment, literal `$VISUAL`, incorrect ignore path, unwanted plugin declarations, and missing initialization.
- After editing, structural checks must demonstrate the inverse and confirm that only the intended lockfile package keys changed.
- A full headless Neovim startup must load without configuration errors.
- Runtime assertions must confirm the `yamlls` schemas and Emmet filetypes are resolved, `EDITOR` equals `VISUAL`, Tree-sitter indentation applies in a new supported buffer, the Python Neotest adapter is registered, and GuessIndent/DAP View initialize.
- Oil and netrw must remain configured, while Neo-tree and Blink Edit must no longer be declared.
