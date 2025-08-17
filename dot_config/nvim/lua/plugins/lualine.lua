return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    local colors = {
      bg = "#0d1011",
      fg = "#ebdbb2",
      yellow = "#fabd2f",
      green = "#99be70",
      purple = "#d3869b",
      blue = "#83a598",
      red = "#fb4934",
      orange = "#fe8019",
      gray = "#928374",
    }

    local mode_colors = {
      n = colors.yellow,
      i = colors.green,
      v = colors.purple,
      V = colors.purple,
      [""] = colors.purple,
      c = colors.blue,
      R = colors.red,
      t = colors.red,
    }

    require("lualine").setup({
      options = {
        component_separators = "",
        section_separators = "",
        theme = {
          normal = { c = { fg = colors.fg, bg = colors.bg } },
          inactive = { c = { fg = colors.gray, bg = colors.bg } },
        },
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            function()
              local mode_map = {
                n = "NORMAL", i = "INSERT", v = "VISUAL", V = "V-LINE",
                [""] = "V-BLOCK", c = "COMMAND", R = "REPLACE", t = "TERMINAL"
              }
              return mode_map[vim.fn.mode()] or "UNKNOWN"
            end,
            color = function() return { fg = mode_colors[vim.fn.mode()], bold = true } end,
            padding = { left = 1, right = 1 },
          },
          { function() return "%=" end },
        },
        lualine_x = {
          {
            "location",
            color = { fg = colors.fg },
            padding = { left = 1, right = 1 },
          },
        },
        lualine_y = {},
        lualine_z = {}
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = { "location" },
        lualine_c = {}, lualine_x = {}, lualine_y = {}, lualine_z = {}
      },
    })
  end,
} 