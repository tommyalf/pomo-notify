# pomo-notify.nvim 🍅🔔

Un piccolo plugin per [pomo.nvim](https://github.com/epwalsh/pomo.nvim)
che mostra una notifica con [nvim-notify](https://github.com/rcarriga/nvim-notify) e un suono alla fine di ogni timer.

## Installazione (LazyVim)

```lua
{
  "tommyalf/pomo-notify.nvim",
  dependencies = {
    "epwalsh/pomo.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    sound = true,
    use_terminal_beep = false,
    timeout = 5000,
  },
}

```
