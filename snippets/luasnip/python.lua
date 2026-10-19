local postfix = require("luasnip.extras.postfix").postfix

local python_expression = [[[%w_%.%-%[%]%(%)"',:]+$]]

local function expression()
  return f(function(_, parent)
    return parent.snippet.env.POSTFIX_MATCH or ""
  end, {})
end

local function context(trigger, name, description)
  return {
    trig = trigger,
    name = name,
    dscr = description,
    match_pattern = python_expression,
    priority = 2000,
  }
end

return {
  postfix(context(".if", "if expression", "Wrap the expression in an if statement."), {
    t("if "), expression(), t({ ":", "    " }), i(0),
  }),
  postfix(context(".ifn", "if not expression", "Wrap the expression in a negated if statement."), {
    t("if not "), expression(), t({ ":", "    " }), i(0),
  }),
  postfix(context(".for", "for expression", "Iterate over the expression."), {
    t("for "), i(1, "item"), t(" in "), expression(), t({ ":", "    " }), i(0),
  }),
  postfix(context(".while", "while expression", "Use the expression as a while condition."), {
    t("while "), expression(), t({ ":", "    " }), i(0),
  }),
  postfix(context(".return", "return expression", "Return the expression."), {
    t("return "), expression(),
  }),
  postfix(context(".yield", "yield expression", "Yield the expression."), {
    t("yield "), expression(),
  }),
  postfix(context(".await", "await expression", "Await the expression."), {
    t("await "), expression(),
  }),
  postfix(context(".print", "print expression", "Pass the expression to print()."), {
    t("print("), expression(), t(")"),
  }),
  postfix(context(".len", "length of expression", "Pass the expression to len()."), {
    t("len("), expression(), t(")"),
  }),
  postfix(context(".isnone", "expression is None", "Test whether the expression is None."), {
    expression(), t(" is None"),
  }),
  postfix(context(".notnone", "expression is not None", "Test whether the expression is not None."), {
    expression(), t(" is not None"),
  }),
}
