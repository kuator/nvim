"https://github.com/asvetliakov/vscode-neovim
if exists('g:vscode')
  nnoremap <silent> K  <Cmd>call VSCodeCall('editor.action.showHover')<CR>
  nnoremap <silent> gr <Cmd>call VSCodeCall('references-view.find')<CR>
  nnoremap <silent> gi <Cmd>call VSCodeCall('references-view.findImplementations')<CR>
  finish
endif
