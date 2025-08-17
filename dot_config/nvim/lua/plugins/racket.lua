return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      racket_langserver = {
        -- no extra settings needed usually
      },
    },
    setup = {
      racket_langserver = function(_, opts)
        local lspconfig = require("lspconfig")
        lspconfig.racket_langserver.setup({
          cmd = { "racket", "-l", "racket-langserver" },
          filetypes = { "racket" },
          root_dir = lspconfig.util.root_pattern("info.rkt", ".git"),
        })
        return true -- Skip default setup
      end,
    },
  },
}
