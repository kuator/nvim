return {
  "simrat39/rust-tools.nvim",
  ft = 'rust',
  config = function ()
    local opts = {
      -- rust-tools options
      tools = {
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
          show_parameter_hints = true,
          parameter_hints_prefix = "",
          other_hints_prefix = "",
        },
      },

      -- all the opts to send to nvim-lspconfig
      -- these override the defaults set by rust-tools.nvim
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      -- https://rust-analyzer.github.io/manual.html#features
      server = {
        settings = {
          ["rust-analyzer"] = {
            assist = {
              importEnforceGranularity = true,
              importPrefix = "crate"
            },
            cargo = {
              allFeatures = true
            },
            checkOnSave = {
              -- default: `cargo check`
              command = "clippy"
            },
          },
          inlayHints = {
            lifetimeElisionHints = {
              enable = true,
              useParameterNames = true
            },
          },
        }
      },
    }

    require('rust-tools').setup(opts)

  end
}
