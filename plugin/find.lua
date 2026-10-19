local fd = vim.fn.executable("fd") == 1 and "fd" or "fdfind"
local ignore_file = vim.fs.joinpath(vim.fn.stdpath("config"), "..", "fd", "ignore")

local function with_global_ignore(command)
  if vim.fn.filereadable(ignore_file) == 1 then
    vim.list_extend(command, { "--ignore-file", ignore_file })
  end
  return command
end

local function run_fd(command)
  local result = vim.system(command, { text = true }):wait()
  if result.code ~= 0 then
    return {}
  end
  return vim.split(result.stdout, "\n", { plain = true, trimempty = true })
end

local function findfunc(cmdarg)
  local command = with_global_ignore({
    fd,
    "--hidden",
    "--color",
    "never",
    "--type",
    "f",
    "--full-path",
    "--fixed-strings",
  })
  if cmdarg ~= "" then
    command[#command + 1] = cmdarg
  end

  local files = run_fd(command)
  table.sort(files)
  return files
end

local function search_files()
  require("minibuffer.builtin.files")({
    cwd = vim.fn.getcwd(),
    rg_opts = with_global_ignore({
      "rg",
      "--files",
      "--hidden",
      "--color",
      "never",
      "--glob",
      "!**/.git/**",
    }),
  })
end

local function env_files()
  require("minibuffer.builtin.files")({
    cwd = vim.fn.getcwd(),
    rg_opts = with_global_ignore({
      "rg",
      "--files",
      "--hidden",
      "--color",
      "never",
      "--no-ignore-vcs",
      "--glob",
      "**/.env*",
      "--glob",
      "!**/.git/**",
    }),
  })
end

local locations = {
  "~/.config/nvim",
  "~/dotfiles",
  "~/.config/zsh",
  "~/dev/personal/algorithms-and-stuff/coursera/electric_boogalo_algorithms",
}
if vim.env.ZK_NOTEBOOK_DIR and vim.env.ZK_NOTEBOOK_DIR ~= "" then
  locations[#locations + 1] = vim.env.ZK_NOTEBOOK_DIR
end

local function select_location()
  vim.ui.select(locations, { prompt = "Locations" }, function(path)
    if path then
      vim.cmd.edit(vim.fn.fnameescape(vim.fn.expand(path)))
    end
  end)
end

local function recent_files()
  require("minibuffer.builtin.oldfiles")()
end

vim.o.findfunc = findfunc

vim.api.nvim_create_user_command("ListEnvs", env_files, {
  desc = "Find recursive .env files with minibuffer",
})
vim.api.nvim_create_user_command("RecentFiles", recent_files, {
  desc = "Find readable files from Neovim's history with minibuffer",
})

vim.keymap.set("n", "<leader>ff", ":find ", { desc = "Find files" })
vim.keymap.set("n", "<leader>sf", search_files, { desc = "Search files" })
vim.keymap.set("n", "<leader>sl", select_location, { desc = "Select location" })
vim.keymap.set("n", "<leader>sr", recent_files, { desc = "Recent files" })
