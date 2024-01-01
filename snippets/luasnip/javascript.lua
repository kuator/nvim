local postfix = require("luasnip.extras.postfix").postfix
return {
  postfix(".tl", {
    f(function(_, parent)
      return "${" .. (parent.snippet.env.POSTFIX_MATCH or "") .. "}"
    end, {}),
  }),
}
