require("which-key").setup {
  triggers_blacklist = {
    i = { "i" },
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
    d = { "goto definition" },
    D = { "goto declaration" },
    r = { "goto references" },
    t = { "goto type definition" },
  }}
)
