
require('nvim-tree').setup {
  view = {
    width = 30,
  },
  renderer = {
    icons = {
      glyphs = {
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
        }
      },
    },
  },
  filters = {
    dotfiles = false,
  },
  actions = {
    open_file = {
      quit_on_open = false,
      window_picker = {
        enable = true,
      }
    }
  },
}
