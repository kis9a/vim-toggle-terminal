## Installation

Use your favorite plugin manager

Example: [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'kis9a/vim-toggle-terminal'
```

## Configuration

```vim
tnoremap <silent> <Esc> <C-\><C-n>
tnoremap <silent> <C-T> <C-\><C-n>:ToggleTerminal<CR>
nnoremap <silent> <C-T> :ToggleTerminal<CR>
nnoremap <silent> <F2> :ToggleTerminal 2<CR>
tnoremap <silent> <F2> <C-\><C-n>:ToggleTerminal<CR>
```
