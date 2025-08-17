return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_lsp = {
          cmd = { "ruby-lsp" },
          filetypes = { "ruby" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("Gemfile", ".git")(fname)
          end,
          init_options = {
            formatter = "auto",
          },
          single_file_support = true,
        },
      },
    },
  },
}