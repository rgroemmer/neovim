-- Select yaml schemas the easy way
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

