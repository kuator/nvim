-- https://www.reddit.com/r/vim/comments/1igue2b/comment/mm2jgms/
function FindFunc(cmdarg)
  local cmd = "fdfind --hidden --no-ignore-vcs --ignore-file $XDG_CONFIG_HOME/.ignore --color never --full-path --type f " .. cmdarg
  return vim.fn.systemlist(cmd)
end

vim.o.findfunc = "v:lua.FindFunc"
