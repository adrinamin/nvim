vim.g.clipboard = {
  name = 'OSC52',
  copy = {
    ['+'] = {'tmux', 'load-buffer', '-'},
    ['*'] = {'tmux', 'load-buffer', '-'},
  },
  paste = {
    ['+'] = {'tmux', 'show-buffer'},
    ['*'] = {'tmux', 'show-buffer'},
  },
}
