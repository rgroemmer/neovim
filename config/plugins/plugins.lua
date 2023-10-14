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

-- tab manager
require('bufferline').setup({
  options = {
    mode = 'buffers',
    offsets = {
      {filetype = 'NvimTree'}
    },
  },
  highlights = {
    buffer_selected = {
      italic = false
    },
    indicator_selected = {
      fg = {attribute = 'fg', highlight = 'Function'},
      italic = false
    }
  }
})

-- autoclose brackets
require('nvim-autopairs').setup({})

-- statusbar
require('lualine').setup({
  options = {
    theme = 'onedark',
    icons_enabled = true,
    component_separators = '|',
    section_separators = '',
  },
})

require('telescope').load_extension('lazygit')

local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})
wilder.set_option('renderer', wilder.popupmenu_renderer(
  wilder.popupmenu_border_theme({
    highlights = {
      border = 'Normal', -- highlight to use for the border
    },
    -- 'single', 'double', 'rounded' or 'solid'
    -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
    border = 'rounded',
  })
))

local cfg = require("yaml-companion").setup({
  schemas = {
    {
      name = "HelmRelease",
      uri = "https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/helmrelease-helm-v2beta1.json",
    },
    {
      name = "HelmRepository",
      uri = "https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/helmrepository-source-v1beta2.json",
    },
    {
      name = "GitRepository",
      uri = "https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/gitrepository-source-v1beta2.json",
    },
    {
      name = "FluxKustomization",
      uri = "https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/kustomization-kustomize-v1beta2.json",
    },
  },
})
require("lspconfig")["yamlls"].setup(cfg)

local highlight = {
    "CursorColumn",
    "Whitespace",
}
require("ibl").setup {
    indent = { highlight = highlight, char = "" },
    whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
    },
    scope = { enabled = false },
}
