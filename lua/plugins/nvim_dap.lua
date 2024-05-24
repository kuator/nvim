return {
  {
    "nvim-neotest/neotest",
    config = function()
    require("neotest").setup({
        adapters = {
          require("neotest-python")({
            dap = { justMyCode = false },
          }),
          -- require("neotest-plenary"),
          -- require("neotest-vim-test")({
          --   ignore_file_types = { "python", "vim", "lua" },
          -- }),
        },
      })

    end,
    dependencies = {
      {
        "nvim-neotest/neotest-python",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    keys = {
      { "<leader>tF", mode="n", "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", desc = "Debug File" },
      { "<leader>tL", mode="n", "<cmd>lua require('neotest').run.run_last({strategy = 'dap'})<cr>", desc = "Debug Last" },
      { "<leader>ta", mode="n", "<cmd>lua require('neotest').run.attach()<cr>", desc = "Attach" },
      { "<leader>tf", mode="n", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "File" },
      { "<leader>tl", mode="n", "<cmd>lua require('neotest').run.run_last()<cr>", desc = "Last" },
      { "<leader>tn", mode="n", "<cmd>lua require('neotest').run.run()<cr>", desc = "Nearest" },
      { "<leader>tN", mode="n", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", desc = "Debug Nearest" },
      { "<leader>to", mode="n", "<cmd>lua require('neotest').output.open({ enter = true })<cr>", desc = "Output" },
      { "<leader>ts", mode="n", "<cmd>lua require('neotest').run.stop()<cr>", desc = "Stop" },
      { "<leader>tS", mode="n", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Summary" },
    },
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "jay-babu/mason-nvim-dap.nvim",
        'mfussenegger/nvim-dap-python',
        { "williamboman/mason.nvim" },
        {
          "rcarriga/nvim-dap-ui",
          dependencies = {
             "nvim-neotest/nvim-nio"
          },
        },
        { "nvim-treesitter/nvim-treesitter" },
        { "nvim-telescope/telescope-dap.nvim" },
        {
          "theHamsta/nvim-dap-virtual-text" ,
          config = function()
            require("nvim-dap-virtual-text").setup {
              commented = true,
            }
          end,
        },
      },
    },
    config = function ()
      require("mason-nvim-dap").setup({
        ensure_installed = { "python" },
        automatic_installation = true,
        -- automatic_setup = false,
        handlers = {}, -- sets up dap in the predefined manner
      })
      -- require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")
      -- require('dap-python').test_runner = 'pytest'
      vim.cmd[[nnoremap <silent> <leader>dn :lua require('dap-python').test_method()<CR>]]
      vim.cmd[[nnoremap <silent> <leader>df :lua require('dap-python').test_class()<CR>]]
      vim.cmd[[vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>]]

      local dap, dapui = require "dap", require "dapui"
      dapui.setup {}

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
    keys = {
      { "<leader>dR", function() require("dap").run_to_cursor() end, desc = "Run to Cursor", },
      { "<leader>dE", function() require("dapui").eval(vim.fn.input "[Expression] > ") end, desc = "Evaluate Input", },
      { "<leader>dC", function() require("dap").set_breakpoint(vim.fn.input "[Condition] > ") end, desc = "Conditional Breakpoint", },
      { "<leader>dU", function() require("dapui").toggle() end, desc = "Toggle UI", },
      { "<leader>db", function() require("dap").step_back() end, desc = "Step Back", },
      { "<leader>dc", function() require("dap").continue() end, desc = "Continue", },
      { "<leader>dd", function() require("dap").disconnect() end, desc = "Disconnect", },
      { "<leader>de", function() require("dapui").eval() end, mode = {"n", "v"}, desc = "Evaluate", },
      { "<leader>dg", function() require("dap").session() end, desc = "Get Session", },
      { "<leader>dh", function() require("dap.ui.widgets").hover() end, desc = "Hover Variables", },
      { "<leader>dS", function() require("dap.ui.widgets").scopes() end, desc = "Scopes", },
      { "<leader>di", function() require("dap").step_into() end, desc = "Step Into", },
      { "<leader>do", function() require("dap").step_over() end, desc = "Step Over", },
      { "<leader>dp", function() require("dap").pause.toggle() end, desc = "Pause", },
      { "<leader>dq", function() require("dap").close() end, desc = "Quit", },
      { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL", },
      { "<leader>ds", function() require("dap").continue() end, desc = "Start", },
      { "<leader>dt", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint", },
      { "<leader>dx", function() require("dap").terminate() end, desc = "Terminate", },
      { "<leader>du", function() require("dap").step_out() end, desc = "Step Out", },
    },
  },
}
