local packages = { "nvim-metals" }

vim.pack.add({
  "https://github.com/scalameta/nvim-metals",
}, { load = false, confirm = false })

local use_for_java = vim.env.NVIM_METALS_JAVA == "1"
local filetypes = { "scala", "sbt" }
if use_for_java then
  filetypes[#filetypes + 1] = "java"
end

local coursier_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "bin")
vim.env.PATH = coursier_dir .. ":" .. vim.env.PATH

local group = vim.api.nvim_create_augroup("nvim-metals-v2", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = filetypes,
  callback = function()
    require("config.lazy").load(packages)

    local metals_config = require("metals").bare_config()
    metals_config.filetypes = filetypes
    metals_config.settings = {
      serverVersion = "2.0.0-M2",
      serverProperties = { "-Xmx4g" },
    }

    require("metals").initialize_or_attach(metals_config)
  end,
})

require("config.lazy").commands("Metals*", packages)
