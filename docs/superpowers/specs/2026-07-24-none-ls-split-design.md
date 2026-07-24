# none-ls Configuration Split

## Goal

Keep language-server configuration and none-ls tooling configuration in separate Neovim plugin files without changing runtime behavior.

## Design

- `plugin/lsp.lua` will retain LSP dependencies, Mason setup, server installation, and server enablement.
- `plugin/none_ls.lua` will own none-ls, none-ls-extras, Plenary, and mason-null-ls dependencies; all none-ls sources; the ESLint configuration guard; and external-tool installation.
- `mason.nvim` remains in `plugin/lsp.lua` because both files use it and `lsp.lua` loads first under Neovim's normal lexicographic plugin sourcing.
- Both files remain self-executing `plugin/*.lua` scripts. No module API or explicit loader will be added.

## Behavior and Failure Handling

The source lists, options, and installation lists will be moved unchanged. Existing `pcall(require, ...)` guards remain, so a missing none-ls or mason-null-ls dependency still skips only its corresponding setup.

## Verification

Run Neovim headlessly to verify startup, assert that none-ls registers, assert that the ESLint resolver returns `nil` for a configless project, and run `git diff --check` on both Lua files.
