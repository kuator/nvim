# Handoff

## Objective

Stabilize Python callable completion in Blink: after explicitly selecting a function/class and pressing `<C-y>`, insert `()` and LuaSnip placeholders for required arguments using `ty` signature help (for example, `hello(name, age)` and `Mine(name, another)`). Avoid implicit first-item acceptance and the intermittent `NAME` replacement. No further implementation was requested after this handoff.

## Current state

- Branch: `main`; HEAD `965b62b feat(update): update`. No commit, PR, or staging was created.
- [lua/config/blink_cmp.lua](lua/config/blink_cmp.lua) now:
  - uses `cmp.accept()`, not `select_and_accept()`, so `<C-y>` accepts only an explicitly selected item;
  - consumes `<C-y>` while the menu is visible but nothing is selected;
  - sets `preselect = false`, `auto_insert = false`, and `show_in_snippet = false`;
  - delegates Python acceptance to `config.python_call_args`.
- [lua/config/python_call_args.lua](lua/config/python_call_args.lua) is new and untracked. It:
  - accepts both string and UTF-16 range-form LSP parameter labels (`ty` uses ranges);
  - excludes `self`, `cls`, variadics, and defaulted/optional parameters;
  - uses `luasnip.lsp_expand()` with an explicit insertion position;
  - requests signature help independently at `0/25/50/100 ms`, with first-success-wins and buffer/window/line/cursor guards;
  - hides an existing Blink menu before expanding the snippet;
  - adds `()` itself for Blink `Class`/`Constructor` items because Blink auto-brackets only `Function`/`Method` kinds.
- [lua/config/lsp.lua](lua/config/lsp.lua) sets `ty.flags.debounce_text_changes = 25` to reduce the synchronization delay. Preserve the pre-existing `vimls` addition in the same file.
- Tree-sitter indentation was briefly disabled, then restored. [plugin/nvim_treesitter.lua](plugin/nvim_treesitter.lua) is back to assigning `require("nvim-treesitter").indentexpr` and has no worktree diff.

## Decisions and rationale

- Signature help must occur after Blink edits the buffer. Immediate requests can see stale text; a fixed 200 ms wait worked but felt laggy. Lowering `ty` debounce to 25 ms plus bounded independent retries avoids one hard timing assumption. Retries must be independent because a stale request can answer slowly.
- Completion inside snippets and automatic selection/insertion were disabled because Blink could replace `${1:name}` with a completion candidate such as `NAME`.
- `<C-y>` intentionally no longer chooses the first item when nothing is selected; use `<C-n>/<C-p>` to select first.
- Do not replace `lsp_expand()` with `snip_expand(parser.parse_snippet(nil, ...))`: `nil` returns nodes rather than a complete snippet object and caused `attempt to call method 'copy' (a nil value)`.

## Verification and unresolved items

- Live `ty` response verified for functions: `(name: str, age: int)` with range labels.
- End-to-end synthetic Blink-callback tests passed for:
  - `hello()` -> `hello(name, age)`;
  - independent retries while Blink restores `hello|()`;
  - existing class call `Mine()` -> `Mine(name, another)`;
  - bare selected class `Mine` -> `Mine(name, another)`.
- Resolved Blink config was checked: `preselect` and `auto_insert` both evaluate false; `show_in_snippet` is false. Lua syntax and `git diff --check` passed.
- User confirmed basic function expansion worked before later race-hardening. The latest `NAME` safeguards and bare-class support have **not** been manually confirmed by the user. Treat these as the highest-priority regression checks.
- Headless tests emit unrelated sandbox/config noise: `EPERM` while lazy-loading packages, inability to write logs/sessions under `~/.local`, and `LSP[ty] Failed to load project` for this Neovim-config workspace. Despite that noise, targeted assertions passed.

## Next steps

1. Fully restart Neovim, explicitly select a completion, and repeatedly test `hello` and bare `Mine`; confirm no `NAME`, no implicit acceptance, and constructor placeholders.
2. If `NAME` persists, capture `:messages`, selected completion item/source, and buffer events; do not assume Blink without evidence. Inspect other completion/snippet/autopair sources.
3. If class completion still stays bare, inspect the real selected item from `require("blink.cmp").get_selected_item()` (especially `kind`) and cursor position in the callback; the synthetic `Class` path passes.
4. Add durable headless tests for `python_call_args` once behavior is manually confirmed, then decide whether to commit.

## Unrelated worktree changes to preserve

Do not overwrite or revert the user's other dirty changes: `lua/config/lazy.lua`, `nvim-pack-lock.json`, `plugin/guess_indent_nvim.lua` (currently disables guess-indent), `plugin/lsp.lua`, `plugin/lualine_nvim.lua`, `tests/lazy_loading.lua`, and untracked `lua/config/codecompanion.lua`, `plugin/codecompanion_nvim.lua`, `tests/lazy_command_completion.lua`. Only the Blink/Python helper changes and `ty` debounce belong to this completion task; `lua/config/lsp.lua` also contains the unrelated pre-existing `vimls` edit.

Repository state is authoritative if it conflicts with this file.
