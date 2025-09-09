vim.g.gutentags_ctags_exclude = {
  '*.git', '*.svg', '*.hg',
  '*/tests/*',
  'build',
  'dist',
  '*sites/*/files/*',
  'bin',
  'node_modules',
  'bower_components',
  'cache',
  'compiled',
  'docs',
  'example',
  'bundle',
  'vendor',
  '*.md',
  '*-lock.json',
  '*.lock',
  '*bundle*.js',
  '*build*.js',
  '.*rc*',
  '*.json',
  '*.min.*',
  '*.map',
  '*.bak',
  '*.zip',
  '*.pyc',
  '*.class',
  '*.sln',
  '*.Master',
  '*.csproj',
  '*.tmp',
  '*.csproj.user',
  '*.cache',
  '*.pdb',
  'tags*',
  'cscope.*',
  '*.exe', '*.dll',
  '*.mp3', '*.ogg', '*.flac',
  '*.swp', '*.swo',
  '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
  '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
  '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
}
vim.g.gutentags_add_default_project_roots = false
vim.g.gutentags_project_root = { 'package.json', '.git' }
vim.g.gutentags_cache_dir = vim.fs.joinpath(vim.fn.stdpath("cache"), 'ctags')
vim.g.gutentags_generate_on_new = true
vim.g.gutentags_generate_on_missing = true
vim.g.gutentags_generate_on_write = true
vim.g.gutentags_generate_on_empty_buffer = true
vim.g.gutentags_file_list_command = "fd"
vim.g.gutentags_modules = { 'ctags', 'cscope_maps' }

-- cscope_maps
vim.g.gutentags_cscope_build_inverted_index_maps = 1
vim.pack.add({ 'https://github.com/dhananjaylatkar/cscope_maps.nvim' }, { load = true, confirm = false })
require("cscope_maps").setup({ disable_maps = true })

vim.pack.add({ 'https://github.com/ludovicchabant/vim-gutentags' }, { load = true, confirm = false })
