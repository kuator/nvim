return {
  "hkupty/nvimux",
  lazy=true,
  config = function()
    local nvimux = require("nvimux")
    -- nvimux.setup({
    --   config = {
    --     prefix = "<C-a>",
    --   },
    --   bindings = {
    --     { { "n", "v", "i", "t" }, "s", nvimux.commands.horizontal_split },
    --     { { "n", "v", "i", "t" }, "v", nvimux.commands.vertical_split },
    --   },
    -- })
  end,
}
