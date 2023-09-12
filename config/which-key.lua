require("which-key").setup {
  triggers_blacklist = {
    i = { "i" },
  },
  layout = {
    height = { min = 10, max = 25 },
    width = { min = 20, max = 50 },
  },
  window = {
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
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

wk.register({
  f = {
    name = "find", -- optional group name
    f = { "find files" },
    g = { "ripgrep" },
    a = { "format file" },
  }}, { prefix = "<leader>" }
)

wk.register({
  g = {
    name = "go tooling", -- optional group name
    t = { "go mod tidy" },
    a = { "format file" },
  }}, { prefix = "<leader>" }
)

wk.register({
  g = {
    name = "code ancestors",
    d = { "goto definition" },
    D = { "goto declaration" },
    r = { "goto references" },
    t = { "goto type definition" },
  }}
)

