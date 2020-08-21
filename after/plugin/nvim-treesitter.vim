" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   textobjects = {
"     select = {
"       enable = true,
"       keymaps = {
"         -- You can use the capture groups defined in textobjects.scm
"         ["af"] = "@function.outer",
"         ["if"] = "@function.inner",
"         ["ac"] = "@class.outer",
"         ["ic"] = "@class.inner",

"         -- Or you can define your own textobjects like this
"         ["iF"] = {
"           python = "(function_definition) @function",
"           cpp = "(function_definition) @function",
"           c = "(function_definition) @function",
"           java = "(method_declaration) @function",
"         },
"       },
"     },
"     swap = {
"       enable = true,
"       swap_next = {
"         ["<leader>a"] = "@parameter.inner",
"       },
"       swap_previous = {
"         ["<leader>A"] = "@parameter.inner",
"       },
"     },
"     move = {
"         enable = true,
"         goto_next_start = {
"           ["]m"] = "@function.outer",
"           ["]]"] = "@class.outer",
"         },
"         goto_next_end = {
"           ["]M"] = "@function.outer",
"           ["]["] = "@class.outer",
"         },
"         goto_previous_start = {
"           ["[m"] = "@function.outer",
"           ["[["] = "@class.outer",
"         },
"         goto_previous_end = {
"           ["[M"] = "@function.outer",
"           ["[]"] = "@class.outer",
"         },
"       },
"   },
"   ensure_installed = "all"
" }
" EOF
