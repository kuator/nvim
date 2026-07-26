# VS Code-style lualine

## Goal

Make Neovim's global statusline resemble VS Code while retaining the user's preferred mode, LSP, and `UNIX` indicators.

## Layout

- Use one flat `#007ACC` background with light text and no separators or decorative endcaps.
- Left group: mode, Git branch, diagnostics, filename.
- Right group: LSP clients attached to the current buffer, location, progress, uppercase encoding, uppercase file format.
- Show `No LSP` when the current buffer has no attached language server.
- Remove the OS icon, filesize, diff counts, centered alignment component, and mode-specific colors.

## Implementation

Keep lualine and its native components. Replace the hand-built insertion helpers and mode table with a direct `lualine.setup()` table and one small current-buffer LSP function.

## Verification

Parse the Lua file, start Neovim headlessly, and confirm the resolved lualine sections contain the agreed left and right groups.
