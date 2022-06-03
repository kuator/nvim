math.randomseed(os.time())

require "options"
require "keymaps"
require "plugins"
require "autocmds"

require "neovim-remote"

-- lua print(vim.inspect(vim.tbl_deep_extend("force", {best= "ps5", irrelevant= "yeah" }, {best= "xbox"})))
