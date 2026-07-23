# tsgo replacement design

## Goal

Replace vtsls with tsgo for JavaScript and TypeScript. Vue language support may be unavailable.

## Changes

- Remove `nvim-vtsls` from `plugin/lsp.lua`.
- Replace Mason's `vtsls` entry with `tsgo`.
- Delete the local `lsp/vtsls.lua`; use nvim-lspconfig's built-in `tsgo` configuration.
- Exclude `tsgo` from LSP formatting, preserving the current TypeScript no-formatting behavior and fixing the existing list lookup.

## Verification

- Assert that tsgo is configured and vtsls is no longer referenced.
- Start Neovim headlessly and confirm a zero exit status.
- Confirm `vim.lsp.config.tsgo` resolves to the `tsgo --lsp --stdio` server configuration.

## Non-goals

- Vue TypeScript support.
- Custom tsgo settings or a fallback TypeScript server.
