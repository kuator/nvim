vim.pack.add({
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
}, { load = false, confirm = false })

local lualine = require('lualine')

local colors = {
  fg = "#e6e6e6",   -- slightly brighter for better contrast
  bg = "#006bb3",   -- slightly darker + less neon than #007acc

  blue   = "#5aa9ff",
  cyan   = "#4ec9b0",
  green  = "#7bd88f",
  yellow = "#FFFF00",
  orange = "#d19a66",
  red    = "#ff5c57",
  purple = "#c792ea",
  deep_blue = "#163f63",

  gray1 = "#c0c7d1",
  gray2 = "#2b2f3a",
  gray3 = "#3a3f4b",
}

-- LuaFormatter on
local darkplus = {
  normal = {
    a = { fg = colors.fg, bg = colors.bg, gui = "bold" },
    b = { fg = colors.fg, bg = colors.bg },
    c = { fg = colors.fg, bg = colors.bg },
  },
  insert = { a = { fg = colors.fg, bg = colors.bg, gui = "bold" } },
  visual = { a = { fg = colors.fg, bg = colors.bg, gui = "bold" } },
  command = { a = { fg = colors.fg, bg = colors.bg, gui = "bold" } },
  replace = { a = { fg = colors.fg, bg = colors.bg, gui = "bold" } },
  inactive = {
    a = { fg = colors.fg, bg = colors.bg },
    b = { fg = colors.fg, bg = colors.bg },
    c = { fg = colors.fg, bg = colors.bg },
  },
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = darkplus
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    return '▊'
  end,
  color = { fg = colors.blue }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
  -- mode component
  function()
    return ''
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { right = 1 },
}

ins_left {
  function()
    local mode_map = {
      n  = "NORMAL",
      i  = "INSERT",
      v  = "VISUAL",
      V  = "V-LINE",
      ["\22"] = "V-BLOCK",
      c  = "COMMAND",
      R  = "REPLACE",
      t  = "TERMINAL",
      s  = "SELECT",
      S  = "S-LINE",
      r  = "PROMPT",
      rm = "MORE",
      ["!"] = "SHELL",
    }

    return " " .. (mode_map[vim.fn.mode()] or "NORMAL") .. " "
  end,

  color = { fg = "#ffffff", gui = "bold" },

  padding = { left = 1, right = 1 },
}

ins_left {
  -- filesize component
  'filesize',
  cond = conditions.buffer_not_empty,
}

ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
  color = { fg = colors.magenta, gui = 'bold' },
}

ins_left { 'location' }

ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    error = { fg = colors.red },
    warn = { fg = colors.yellow },
    info = { fg = colors.cyan },
  },
  color = { bg = colors.deep_blue }
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return '%='
  end,
}

ins_left {
  -- Lsp server name .
  function()
    local buf_ft = vim.bo.filetype
    local clients = vim.lsp.get_clients()

    if vim.tbl_isempty(clients) then
      return "No Active Lsp"
    end

    local active_clients = {}

    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if not filetypes or vim.fn.index(filetypes, buf_ft) ~= -1 then
        table.insert(active_clients, client.name)
      end
    end

    if #active_clients == 0 then
      return "No Active Lsp"
    end

    return table.concat(active_clients, ", ")
  end,
  icon = ' LSP:',
  color = { fg = '#ffffff', gui = 'bold' },
}

-- Add components to right sections
ins_right {
  'o:encoding', -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = colors.green, gui = 'bold',  bg = colors.deep_blue },
}

ins_right {
  'fileformat',
  fmt = string.upper,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.green, gui = 'bold',  bg = colors.deep_blue  },
}

ins_right {
  'branch',
  icon = '',
  color = { fg = colors.violet, gui = 'bold' ,  bg = colors.deep_blue },
}

ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.yellow },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
  color = { bg = colors.deep_blue }
}

ins_right {
  function()
    return '▊'
  end,
  color = { fg = colors.blue },
  padding = { left = 1 },
}

-- Now don't forget to initialize lualine
lualine.setup(config)
