local postfix = require("luasnip.extras.postfix").postfix
return {
  postfix(".cc", {
    f(function(_, parent)
      return (parent.snippet.env.POSTFIX_MATCH or "") .. "::"
    end, {}),
  }),
  postfix(".qq", {
    f(function(_, parent)
      return "\"" .. (parent.snippet.env.POSTFIX_MATCH or "") .. "\""
    end, {}),
  }),
  -- postfix(".tt", {
  --   f(function(_, parent)
  --     return "<" .. (parent.snippet.env.POSTFIX_MATCH or "") .. ">"
  --   end, {}),
  -- }),
  postfix(".c", {
    f(function(_, parent)
      return (parent.snippet.env.POSTFIX_MATCH or "") .. ":"
    end, {}),
  }),
  postfix(".bb", {
    f(function(_, parent)
      if parent.snippet.env.POSTFIX_MATCH then
        return (parent.snippet.env.POSTFIX_MATCH)
      else
        return ""
      end
    end, {show_condition = function (line_to_cursor)
      return false
    end}),t("(") , i(1), t(")")
  }),
  postfix(".tt", {
    f(function(_, parent)
      if parent.snippet.env.POSTFIX_MATCH then
        return (parent.snippet.env.POSTFIX_MATCH)
      else
        return ""
      end
    end, {show_condition = function (line_to_cursor)
      return false
    end}),t("<") , i(1), t(">")
  }),
  -- s({trig=".bb"}, { t("("), i(1), t(")") }),
  s({trig="and"}, { t("&&") }),
  s({trig="not"}, { t("!=") }),
  s({trig="em"}, { t("!") }),
  s({trig="or"}, { t("||") }),
  s({trig="or1"}, { t("|") }),
  s({trig="and1"}, { t("&") }),
  s("bt", {
        t({"`"}), i(1), t({"`"})
  }),
  s("bb", {
        t({"("}), i(1), t({")"})
  }),
  s("cc", {
        t({"{"}), i(1), t({"}"})
  }),
  s("pl", {
        t({"+"})
  }),
  s("ar", {
        t({"->"})
  }),
  s("pleq", {
        t({"+="})
  }),
  s("lt", {
        t({"< "}), i(1)
  }),
  s("gt", {
        t({"> "}), i(1)
  }),
  s("lte", {
        t({"<= "}), i(1)
  }),
  s("gte", {
        t({">= "}), i(1)
  }),
  s("qq", {
        t({"\""}), i(1), t({"\""})
  }),
  s("tt", {
    t({"<"}), i(1), t({">"})
  }),
  s("--", {
    t({"_"})
  }),
}
