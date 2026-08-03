require("overseer").setup({
  task_list = {
    direction = "bottom",
    min_height = 35,
    max_height = 35,
    default_detail = 2,
  },

  form = {
    border = "rounded",
    zindex = 40,
  },

  task_launcher = {
    default_detail = 1,
  },
})
