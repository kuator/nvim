return {
  node_movement = {
    enable = true,
    keymaps = {
      -- move_up = "<a-k>",
      -- move_down = "<a-j>",
      -- move_left = "<a-h>",
      -- move_right = "<a-l>",
      swap_left = "<a-h>", -- will only swap when one of "swappable_textobjects" is selected
      swap_right = "<a-l>",
      select_current_node = "<a-m>",
    },
    swappable_textobjects = {'@function.outer', '@parameter.inner', '@statement.outer'},
    allow_switch_parents = true, -- more craziness by switching parents while staying on the same level, false prevents you from accidentally jumping out of a function
    allow_next_parent = true, -- more craziness by going up one level if next node does not have children
  }
}
