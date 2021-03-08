return function ()
  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true
    },
    incremental_selection = {
      enable = false,
      keymaps = {
        init_selection = "<c-m>",
        node_incremental = "<c-i>n",
        scope_incremental = "<c-i>c",
        node_decremental = "<c-i>m",
      },
    },
    refactor = {
      highlight_definitions = {
        enable = true
      },
      highlight_current_scope = {
        enable = true
      },
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = "<leader>tr"
        }
      },
      navigation = {
        enable = true,
        keymaps = {
          goto_definition = "<leader>td",
          list_definitions = "<leader>tl"
        }
      }
    },
    rainbow = {
      enable = false,
      disable = {'bash'} -- please disable bash until I figure #1 out
    },
    textobjects = {
      enable=true,
      select = {
        enable = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["aC"] = "@class.outer",
          ["iC"] = "@class.inner",
          ["ac"] = "@conditional.outer",
          ["ic"] = "@conditional.inner",
          ["is"] = "@statement.inner",
          ["as"] = "@statement.outer",
          ["ad"] = "@lhs.inner",
          ["id"] = "@rhs.inner",
          ["am"] = "@call.outer",
          ["im"] = "@call.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
          ["at"] = "@block.outer",
          ["it"] = "@block.inner",

          -- -- Or you can define your own textobjects like this
          ["iF"] = {
            python = "(function_definition) @function",
            cpp = "(function_definition) @function",
            c = "(function_definition) @function",
            java = "(method_declaration) @function",
          },
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>al"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>ah"] = "@parameter.inner",
        },
      },
      move = {
        enable = true,
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
    },
    ensure_installed = "all"
  }
end
