return {
  "mrjones2014/dash.nvim",
  build = "make install", -- This is needed for the plugin to work
  cmd = "Dash", -- Only load when the Dash command is used
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    -- Add a keybinding to open Dash
    { "<leader>dh", "<cmd>Dash<cr>", desc = "Open Dash" },
  },
  config = function()
    -- Basic configuration
    vim.g.dash_map = {
      -- Map dash to open in a new tab
      dash_open_in_new_tab = 1,
    }
    -- Configure dash to use telescope
    vim.g.dash_use_telescope = 1
  end,
} 