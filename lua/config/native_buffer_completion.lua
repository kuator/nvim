local M = {}

local MIN_PREFIX_LENGTH = 3
local MAX_ITEMS = 50
local MAX_INDEXED_LINES = 20000
local MAX_INDEXED_WORDS = 10000

local cache = {}

local keywords = {
  ["and"] = true,
  ["as"] = true,
  ["assert"] = true,
  ["async"] = true,
  ["await"] = true,
  ["break"] = true,
  ["case"] = true,
  ["catch"] = true,
  ["class"] = true,
  ["const"] = true,
  ["continue"] = true,
  ["def"] = true,
  ["del"] = true,
  ["do"] = true,
  ["else"] = true,
  ["enum"] = true,
  ["except"] = true,
  ["export"] = true,
  ["extends"] = true,
  ["false"] = true,
  ["finally"] = true,
  ["for"] = true,
  ["from"] = true,
  ["function"] = true,
  ["if"] = true,
  ["implements"] = true,
  ["import"] = true,
  ["in"] = true,
  ["instanceof"] = true,
  ["interface"] = true,
  ["is"] = true,
  ["lambda"] = true,
  ["let"] = true,
  ["new"] = true,
  ["nil"] = true,
  ["none"] = true,
  ["null"] = true,
  ["or"] = true,
  ["package"] = true,
  ["pass"] = true,
  ["private"] = true,
  ["protected"] = true,
  ["public"] = true,
  ["raise"] = true,
  ["return"] = true,
  ["static"] = true,
  ["struct"] = true,
  ["super"] = true,
  ["switch"] = true,
  ["this"] = true,
  ["throw"] = true,
  ["true"] = true,
  ["try"] = true,
  ["type"] = true,
  ["var"] = true,
  ["while"] = true,
  ["with"] = true,
  ["yield"] = true,
}

local function indexable(buf)
  return vim.api.nvim_buf_is_valid(buf)
    and vim.api.nvim_buf_is_loaded(buf)
    and vim.bo[buf].buftype == ""
    and not vim.bo[buf].binary
end

local function build_index(buf)
  if not indexable(buf) then
    cache[buf] = nil
    return
  end

  local line_count = vim.api.nvim_buf_line_count(buf)
  local stop = math.min(line_count, MAX_INDEXED_LINES)
  local words = {}
  local order = {}

  for _, line in ipairs(vim.api.nvim_buf_get_lines(buf, 0, stop, false)) do
    for word in line:gmatch("[A-Za-z_][A-Za-z0-9_]*") do
      local normalized = word:lower()
      if #word >= MIN_PREFIX_LENGTH and not keywords[normalized] then
        local entry = words[normalized]
        if entry then
          entry.count = entry.count + 1
        elseif #order < MAX_INDEXED_WORDS then
          entry = {
            count = 1,
            normalized = normalized,
            order = #order + 1,
            word = word,
          }
          words[normalized] = entry
          order[#order + 1] = entry
        end
      end
    end
  end

  cache[buf] = order
end

local function visible_buffers(current)
  local buffers = { current }
  local seen = { [current] = true }

  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if not seen[buf] and indexable(buf) then
      seen[buf] = true
      buffers[#buffers + 1] = buf
    end
  end

  return buffers
end

local function match_rank(word, base)
  if vim.startswith(word, base) then
    return 0
  end

  local substring = word:find(base, 1, true)
  if substring then
    return 100 + substring
  end

  local cursor = 1
  local gap = 0
  for i = 1, #base do
    local found = word:find(base:sub(i, i), cursor, true)
    if not found then
      return nil
    end
    gap = gap + found - cursor
    cursor = found + 1
  end

  return 1000 + gap
end

local function candidates(base)
  if #base < MIN_PREFIX_LENGTH then
    return {}
  end

  local current = vim.api.nvim_get_current_buf()
  local found = {}

  for source_rank, buf in ipairs(visible_buffers(current)) do
    if not cache[buf] then
      build_index(buf)
    end

    for _, entry in ipairs(cache[buf] or {}) do
      local rank = match_rank(entry.normalized, base:lower())
      local existing = found[entry.normalized]
      if rank and (not existing or source_rank < existing.source_rank) then
        found[entry.normalized] = {
          count = entry.count,
          match_rank = rank,
          order = entry.order,
          source_rank = source_rank,
          word = entry.word,
        }
      end
    end
  end

  local matches = vim.tbl_values(found)
  table.sort(matches, function(a, b)
    if a.match_rank ~= b.match_rank then
      return a.match_rank < b.match_rank
    end
    if a.source_rank ~= b.source_rank then
      return a.source_rank < b.source_rank
    end
    if a.count ~= b.count then
      return a.count > b.count
    end
    if a.order ~= b.order then
      return a.order < b.order
    end
    return a.word < b.word
  end)

  local result = {}
  for i = 1, math.min(#matches, MAX_ITEMS) do
    local word = matches[i].word
    result[i] = {
      word = word,
      abbr = " " .. word .. " ",
      kind = " " .. require("lspkind").symbolic("Text") .. " ",
      kind_hlgroup = "NativeCompletionKindText",
      menu = " [Buffer] ",
      icase = 1,
      dup = 0,
      user_data = { native_buffer_completion = true },
    }
  end

  return result
end

function M.complete(findstart, base)
  if not indexable(vim.api.nvim_get_current_buf()) then
    return findstart == 1 and -3 or {}
  end

  if findstart == 1 then
    local line = vim.api.nvim_get_current_line()
    local start = vim.fn.col(".") - 1
    while start > 0 and line:sub(start, start):match("[A-Za-z0-9_]") do
      start = start - 1
    end
    return start
  end

  return {
    words = candidates(base),
    refresh = "always",
  }
end

function M.setup()
  vim.o.completefunc = M.complete

  local group =
    vim.api.nvim_create_augroup("native-buffer-completion-cache", { clear = true })

  vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave", "TextChanged" }, {
    group = group,
    callback = function(ev)
      build_index(ev.buf)
    end,
  })
  vim.api.nvim_create_autocmd({ "BufDelete", "BufWipeout" }, {
    group = group,
    callback = function(ev)
      cache[ev.buf] = nil
    end,
  })
end

M._build_index = build_index
M._candidates = candidates

return M
