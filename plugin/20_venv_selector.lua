vim.pack.add({ "https://github.com/linux-cultist/venv-selector.nvim" }, { load = true, confirm = false })

-- require("venv-selector").setup({
--     options = {
--       on_venv_activate_callback = nil,          -- callback function for after a venv activates
--       enable_default_searches = true,           -- switches all default searches on/off
--       enable_cached_venvs = true,               -- use cached venvs that are activated automatically when a python file is registered with the LSP.
--       cached_venv_automatic_activation = true, -- if set to false, the VenvSelectCached command becomes available to manually activate them.
--       activate_venv_in_terminal = false,         -- activate the selected python interpreter in terminal windows opened from neovim
--       set_environment_variables = true,         -- sets VIRTUAL_ENV or CONDA_PREFIX environment variables
--       notify_user_on_venv_activation = true,    -- notifies user on activation of the virtual env
--       search_timeout = 5,                       -- if a search takes longer than this many seconds, stop it and alert the user
--       fd_binary_name = "fd",                    -- plugin looks for `fd` or `fdfind` but you can set something else here
--       require_lsp_activation = false,            -- require activation of an lsp before setting env variables
--       debug = true
--     },
--     search = {
--       find_code_venvs = {
--         command = "fd /bin/python$ /tmp --full-path",
--       },
--    },
-- })


-- require("venv-selector").setup({})
