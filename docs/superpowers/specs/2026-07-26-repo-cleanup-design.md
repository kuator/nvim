# Neovim Repository Cleanup Design

## Goal

Apply the verified correctness fixes, remove explicitly unwanted or dead configuration, initialize retained plugins completely, and simplify duplicated configuration without changing the user's chosen workflows.

## Correctness fixes

- Rename `lsp/yaml.lua` to `lsp/yamlls.lua` so the enabled `yamlls` configuration receives SchemaStore settings.
- Rename `lsp/emmet_ls.lua` to `lsp/emmet_language_server.lua` so the enabled Emmet server receives the custom filetypes.
- Move the Tree-sitter `indentexpr` assignment into the existing supported-language `FileType` callback.
- Assign `vim.env.EDITOR = vim.env.VISUAL` instead of the literal `$VISUAL` string.
- Correct the `<leader>lf` ignore-file path to `$XDG_CONFIG_HOME/.ignore`.

## Plugin removals and retention

Remove:

- Neo-tree and its explicit `nui.nvim` dependency.
- Blink Edit.
- The inactive `lua_ls` configuration.
- The inactive SonarLint configuration and mason-null-ls installation entry.
- Outline; Aerial remains the symbol outline.
- Venom, `neoconf-venom.nvim`, and `neoconf.nvim`.
- Import.nvim and its Telescope setup because current upstream still triggers deprecated Neovim API warnings.

Keep:

- Oil and `netrw.nvim`.
- Aerial.
- Checkstyle with `-c /google_checks.xml`, which is a bundled Checkstyle classpath resource.
- `nvim-jdtls` using the native `vim.lsp.enable("jdtls")` path.
- Plenary temporarily because Telescope, none-ls, Neotest, and Diffview still depend on it. Its upstream maintenance warning is accepted until those consumers are migrated in a separate redesign.

## Plugin initialization

- Add `nvim-neotest/neotest-python`, `nvim-neotest/nvim-nio`, and `antoinemadec/FixCursorHold.nvim` alongside Neotest.
- Initialize Neotest with the default Python adapter, supporting pytest and unittest.
- Explicitly initialize DAP View with its default configuration.
- Initialize GuessIndent with its default configuration.

## Dead configuration and generated artifacts

- Remove comment-only or empty configuration files for Alpha, CodeCompanion, Heirline, Hlchunk, Lensline, render-markdown, UFO, venv-selector, vim-after-object, vim-ninja-feet, the obsolete Java ftplugin, and the empty `plugin/40_plugins.lua`.
- Remove the duplicate `plugin-oil/oil_nvim.lua` file.
- Remove generated `docs/superpowers` plans and specifications after this design has been committed for Git history.
- Remove the generated untracked `nvim.log` file.

## Snippet cleanup

- Reduce `snippets/vscode/package.json` to entries for the three files that exist: `global.json`, `go.json`, and `java.json`.
- Remove `snippets/luasnip/custom.lua` because its `qq` and `tt` snippets duplicate `all.lua`.
- Keep one default lazy-load call per LuaSnip loader and remove the second explicit loading of the same config snippet directories.

## Configuration simplification

- Remove the duplicate `vim-repeat` URL.
- Define the Overseer task starter once and parameterize only the internal/external module namespace and chat command.
- Remove `TabSwitch`'s dead first traversal and global `split()` helper; parse the numeric prefix with `opts.args:match("^%d+")`.
- Simplify Telescope by removing the one-use outer wrapper, commented alternative picker, no-op `attach_mappings`, and Import integration.
- Remove the one-use setup wrappers in LSP, none-ls, and debugprint configuration while preserving their behavior.
- Remove the empty `automatic_enable.exclude` table.
- Retain Gutentags' exclusion list and change only its file listing command to `fd --type f`.
- Remove the private `vim._core.ui2` call and use Neovim's native UI.
- Reduce statuscol exclusions to configured special buffers: help, Mason, netrw, Oil, and Startify; terminal buffers remain covered by `bt_ignore`.

## Lockfile cleanup

- Add lock entries for `neotest-python`, `nvim-nio`, and `FixCursorHold.nvim` through `vim.pack.add`.
- Remove lock entries for packages removed by this design, including Neo-tree, Nui, Blink Edit, Outline, Import, Venom/Neoconf, and stale entries with no active declaration such as Heirline, lualine-time, nvim-vtsls, and render-markdown.
- Preserve all unrelated existing lockfile changes and revisions.

## Verification

- Capture structural checks that fail before the edits and pass afterward for every correctness fix and removal.
- Parse every remaining Lua configuration file with Neovim.
- Run a full headless startup using the real configuration.
- Assert that `yamlls` contains SchemaStore schemas, Emmet contains the custom filetypes, `EDITOR` equals `VISUAL`, and Tree-sitter indentation applies in a new supported buffer.
- Assert that Neotest exposes the Python adapter and that DAP View and GuessIndent are initialized.
- Assert that Oil, netrw, Aerial, Checkstyle, `nvim-jdtls`, and Plenary remain available.
- Assert that Neo-tree, Blink Edit, Outline, Import, Venom, `lua_ls`, and SonarLint are no longer configured.
- Run `git diff --check` and inspect the complete diff without modifying unrelated user changes.
