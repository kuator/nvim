require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
  incremental_selection = {
    enable = false,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
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
  textobjects = {
    enable=true,
    select = {
      enable = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

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
        ["<leader>nfs"] = "@function.outer",
        ["<leader>ncs"] = "@class.outer",
      },
      goto_next_end = {
        ["<leader>nfe"] = "@function.outer",
        ["<leader>nce"] = "@class.outer",
      },
      goto_previous_start = {
        ["<leader>lfs"] = "@function.outer",
        ["<leader>lcs"] = "@class.outer",
      },
      goto_previous_end = {
        ["<leader>lfe"] = "@function.outer",
        ["<leader>lce"] = "@class.outer",
      },
    },
  },
  ensure_installed = "all"
}
