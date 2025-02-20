return {
  "luukvbaal/statuscol.nvim",
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      -- configuration goes here, for example:
      relculright = true,
      segments = {
        { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
        { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
        { sign = { namespace = { "gitsigns" }, colwidth = 1, wrap = true }, click = "v:lua.ScSa" },
      }
    })
  end,
}
