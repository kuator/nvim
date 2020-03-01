" https://vi.stackexchange.com/questions/20605/find-project-root-relative-to-the-active-buffer
let dir = finddir('.git/..', expand('%:p:h').';')
