-- Copyright (c) 2020-2021 shadmansaleh
-- MIT license, see LICENSE for more details.
-- Credit: Zoltan Dalmadi(lightline)
-- LuaFormatter off
local colors = {
  blue   = '#569cd6',
  green  = '#6a9955',
  purple = '#c586c0',
  red1   = '#d16969',
  yellow = '#dcdcaa',
  orange = '#ce9178',
  fg     = '#d4d4d4',
  bg     = '#007acc',
  -- bg     = '#68217a',
  -- bg     = '#252525',
  gray1  = '#5c6370',
  gray2  = '#2c323d',
  gray3  = '#3e4452',
}
-- LuaFormatter on
local darkplus = {
  normal = {
    a = {fg = colors.fg, bg = colors.bg, gui = 'bold'},
    b = {fg = colors.fg, bg = colors.bg},
    c = {fg = colors.fg, bg = colors.bg}
  },
  insert = {a = {fg = colors.fg, bg = colors.bg, gui = 'bold'}},
  visual = {a = {fg = colors.fg, bg = colors.bg, gui = 'bold'}},
  command = {a = {fg = colors.fg, bg = colors.bg, gui = 'bold'}},
  replace = {a = {fg = colors.fg, bg = colors.bg, gui = 'bold'}},
  inactive = {
    a = {fg = colors.fg, bg = colors.bg},
    b = {fg = colors.fg, bg = colors.bg},
    c = {fg = colors.fg, bg = colors.bg}
  }
}



return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
  config=function()
    local status_ok, lualine = pcall(require, "lualine")
    if not status_ok then
      return
    end

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end

    local buffers = {
      'buffers',
      show_filename_only = true,   -- Shows shortened relative path when set to false.
      hide_filename_extension = false,   -- Hide filename extension when set to true.
      show_modified_status = true, -- Shows indicator when the buffer is modified.
    }

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn" },
      symbols = { error = " ", warn = " " },
      colored = false,
      update_in_insert = false,
      always_visible = true,
    }

    local diff = {
      "diff",
      colored = false,
      symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
      cond = hide_in_width
    }

    local mode = {
      "mode",
      fmt = function(str)
        return "-- " .. str .. " --"
      end,
    }

    local filetype = {
      "filetype",
      icons_enabled = false,
      icon = nil,
    }

    local branch = {
      "branch",
      icons_enabled = true,
      icon = "",
    }

    local location = {
      "location",
      padding = 0,
    }

    local filename = {
       'filename',
       file_status = true,      -- Displays file status (readonly status, modified status)
       path = 1,                -- 0: Just the filename
                                -- 1: Relative path
                                -- 2: Absolute path
                                -- 3: Absolute path, with tilde as the home directory

       shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
                                -- for other components. (terrible name, any suggestions?)
       symbols = {
         modified = '[+]',      -- Text to show when the file is modified.
         readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
         unnamed = '[No Name]', -- Text to show for unnamed buffers.
       }
     }

    -- cool function for progress
    local progress = function()
      local current_line = vim.fn.line(".")
      local total_lines = vim.fn.line("$")
      local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
      local line_ratio = current_line / total_lines
      local index = math.ceil(line_ratio * #chars)
      return chars[index]
    end

    local spaces = function()
      return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
    end

    lualine.setup({
      options = {
        icons_enabled = true,
        -- theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
        always_divide_middle = true,
        theme = darkplus
        -- theme = 'auto'
      },
      sections = {
        lualine_a = { branch, diagnostics },
        lualine_b = { mode, filename },
        lualine_c = {},
        -- lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_x = { diff, spaces, "encoding", filetype },
        lualine_y = { location },
        lualine_z = { progress },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {},
    })
  end
}
