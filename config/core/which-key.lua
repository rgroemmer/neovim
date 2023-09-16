require("which-key").setup {
  triggers_blacklist = {
    i = { "i" },
  },
  layout = {
    height = { min = 10, max = 25 },
    width = { min = 20, max = 50 },
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    ["<space>"] = "space",
    ["<cr>"] = "enter",
    ["<tab>"] = "tab",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "➤ ", -- symbol prepended to a group
  },
}
local wk = require('which-key')

-- keymap documentation
-- leader keymap
wk.register({
  f = {
    name = "find",
    f = { "find files" },
    g = { "ripgrep" },
    a = { "format file" },
  },

  g = {
    name = "go tooling",
    t = { "go mod tidy" },
    a = { "format file" },
  },

  t = "pick buffer",
  h = "prev buffer",
  l = "next buffer",
  ['<space>'] = "which_key_ignore",

  }, { prefix = "<leader>" }
)

-- code keymap
wk.register({
  g = {
    name = "code ancestors",
    d = { "goto definition" },
    D = { "goto declaration" },
    r = { "goto references" },
    t = { "goto type definition" },
  }}
)

