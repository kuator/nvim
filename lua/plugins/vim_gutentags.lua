return {
  'ludovicchabant/vim-gutentags',
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "dhananjaylatkar/cscope_maps.nvim",
      dependencies = {
        "folke/which-key.nvim",
        "telescope.nvim",
      },
      config = function()
        require("cscope_maps").setup({
          disable_maps = true,
          cscope = {
            use_telescope = true,
          },
        })
      end,
    },
  },
  init = function()
    -- https://www.reddit.com/r/vim/comments/d77t6j/guide_how_to_setup_ctags_with_gutentags_properly/
    vim.g.gutentags_ctags_exclude = {
      '*.git',
      '*.svg',
      '*.hg',
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
      '*.ass',
      '*.srt',
      '*.sln',
      '*.Master',
      '*.csproj',
      '*.tmp',
      '*.csproj.user',
      '*.cache',
      '*.pdb',
      'tags*',
      'cscope.*',
      -- '*.css',
      -- '*.less',
      -- '*.scss',
      '*.exe',
      '*.dll',
      '*.mp3',
      '*.ogg',
      '*.flac',
      '*.swp',
      '*.swo',
      '*.bmp',
      '*.gif',
      '*.ico',
      '*.jpg',
      '*.png',
      '*.rar',
      '*.zip',
      '*.tar',
      '*.tar.gz',
      '*.tar.xz',
      '*.tar.bz2',
      '*.pdf',
      '*.doc',
      '*.docx',
      '*.ppt',
      '*.pptx',
    }

    vim.g.gutentags_add_default_project_roots = false
    vim.g.gutentags_project_root = { 'package.json', '.git' }
    vim.g.gutentags_cache_dir = vim.fn.stdpath("cache")

    vim.g.gutentags_generate_on_new = true
    vim.g.gutentags_generate_on_missing = true
    vim.g.gutentags_generate_on_write = true
    vim.g.gutentags_generate_on_empty_buffer = true
    vim.g.gutentags_modules = true
    vim.cmd([[command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')]])
    vim.g.gutentags_ctags_extra_args = { '--tag-relative=yes', '--fields=+ailmnS', }

    vim.g.gutentags_file_list_command = "fd -e c -e h"
    vim.g.gutentags_cscope_build_inverted_index_maps = 1

    -- custom
    vim.g.gutentags_modules = { 'cscope_maps', 'ctags'}
  end
}
