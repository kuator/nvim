local actions = require "telescope.actions"
local action_set = require "telescope.actions.set"
local action_state = require "telescope.actions.state"
local finders = require "telescope.finders"
local make_entry = require "telescope.make_entry"
local Path = require "plenary.path"
local pickers = require "telescope.pickers"
local previewers = require "telescope.previewers"
local p_window = require "telescope.pickers.window"
local sorters = require "telescope.sorters"
local state = require "telescope.state"
local utils = require "telescope.utils"

local conf = require("telescope.config").values

local filter = vim.tbl_filter

-- Makes sure aliased options are set correctly
local function apply_cwd_only_aliases(opts)
  local has_cwd_only = opts.cwd_only ~= nil
  local has_only_cwd = opts.only_cwd ~= nil

  if has_only_cwd and not has_cwd_only then
    -- Internally, use cwd_only
    opts.cwd_only = opts.only_cwd
    opts.only_cwd = nil
  end

  return opts
end

local internal = {}

-- our picker function: colors
local colors = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "colors",
    finder = finders.new_table {
      results = { "red", "green", "blue" }
    },
    sorter = conf.generic_sorter(opts),
  }):find()
end

return colors
