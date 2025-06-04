return {
  'aaronik/treewalker.nvim',

  -- The following options are the defaults.
  -- Treewalker aims for sane defaults, so these are each individually optional,
  -- and setup() does not need to be called, so the whole opts block is optional as well.
  opts = {
    -- Whether to briefly highlight the node after jumping to it
    highlight = true,

    -- How long should above highlight last (in ms)
    highlight_duration = 250,

    -- The color of the above highlight. Must be a valid vim highlight group.
    -- (see :h highlight-group for options)
    highlight_group = 'CursorLine',

    -- Whether the plugin adds movements to the jumplist -- true | false | 'left'
    --  true: All movements more than 1 line are added to the jumplist. This is the default,
    --        and is meant to cover most use cases. It's modeled on how { and } natively add
    --        to the jumplist.
    --  false: Treewalker does not add to the jumplist at all
    --  "left": Treewalker only adds :Treewalker Left to the jumplist. This is usually the most
    --          likely one to be confusing, so it has its own mode.
    jumplist = true,
  },
  config = function ()
  -- :Treewalker Up - Moves up to the previous neighbor node
  -- :Treewalker Down - Moves down to the next neighbor node
  -- :Treewalker Left - Moves to the first ancestor node that's on a different line from the current node
  -- :Treewalker Right - Moves to the next node down that's indented further than the current node

    -- vim.keymap.set({ 'n', 'v' }, '<C-p>', '<cmd>Treewalker Up<cr>', { silent = true })
    -- vim.keymap.set({ 'n', 'v' }, '<C-n>', '<cmd>Treewalker Down<cr>', { silent = true })
    -- vim.keymap.set({ 'n', 'v' }, '<a-n>', '<cmd>Treewalker Left<cr>', { silent = true })
    -- vim.keymap.set({ 'n', 'v' }, '<a-p>', '<cmd>Treewalker Right<cr>', { silent = true })
  end
}
