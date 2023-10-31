-- explorer
require('nvim-tree').setup({
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
   git = {
     ignore = false;
   },
  diagnostics = {
    enable = true;
    show_on_dirs = true;
  },
})

