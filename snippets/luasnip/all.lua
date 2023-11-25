local postfix = require("luasnip.extras.postfix").postfix
return {
  postfix(".cc", {
    f(function(_, parent)
      return parent.snippet.env.POSTFIX_MATCH .. "::"
    end, {}),
  }),
  postfix(".br", {
    f(function(_, parent)
      return "[" .. parent.snippet.env.POSTFIX_MATCH .. "]"
    end, {}),
  }),
  postfix(".qq", {
    f(function(_, parent)
      return "\"" .. parent.snippet.env.POSTFIX_MATCH .. "\""
    end, {}),
  }),
  postfix(".tt", {
    f(function(_, parent)
      return "<" .. parent.snippet.env.POSTFIX_MATCH .. ">"
    end, {}),
  }),
}
