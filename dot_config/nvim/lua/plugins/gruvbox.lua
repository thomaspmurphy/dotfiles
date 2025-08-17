return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    terminal_colors = true,
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
      strings = true,
      emphasis = true,
      comments = true,
      operators = false,
      folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true,
    contrast = "hard", -- can be "hard", "soft" or empty string
    palette_overrides = {
      -- Make background even darker than hard contrast
      dark0_hard = "#0d1011",     -- Even darker than gruvbox hard (#1d2021)
      dark0 = "#0d1011",
      dark0_soft = "#0d1011",
      dark1 = "#1c1f20",
      dark2 = "#2d3031", 
    },
    overrides = {
      -- Keep dark background
      Normal = { bg = "#0d1011" },
      NormalFloat = { bg = "#0d1011" },
      SignColumn = { bg = "#0d1011" },
      EndOfBuffer = { bg = "#0d1011" },
      
      -- Autumn night inspired syntax colors
      -- Keywords in red (like autumn_night my_red)
      Keyword = { fg = "#F05E48", italic = false },
      Statement = { fg = "#F05E48" },
      Conditional = { fg = "#F05E48" },
      Repeat = { fg = "#F05E48" },
      Label = { fg = "#F05E48" },
      Operator = { fg = "#F3F2CC" }, -- my_white1
      Exception = { fg = "#F05E48" },
      PreProc = { fg = "#F05E48" },
      Include = { fg = "#F05E48" },
      Define = { fg = "#F05E48" },
      Macro = { fg = "#F05E48" },
      PreCondit = { fg = "#F05E48" },
      
      -- Functions in yellow (like autumn_night my_yellow1)
      Function = { fg = "#FAD566" },
      Identifier = { fg = "#F3F2CC" }, -- my_white1
      
      -- Strings in green (like autumn_night my_green)
      String = { fg = "#99be70" },
      Character = { fg = "#99be70" },
      
      -- Numbers and constants in turquoise (like autumn_night my_turquoise1)
      Number = { fg = "#86c1b9" },
      Float = { fg = "#86c1b9" },
      Boolean = { fg = "#86c1b9" },
      Constant = { fg = "#F3F2CC" }, -- my_white1
      
      -- Types in white italic (like autumn_night)
      Type = { fg = "#F3F2CC", italic = true }, -- my_white1
      StorageClass = { fg = "#F3F2CC", italic = true },
      Structure = { fg = "#F3F2CC", italic = true },
      Typedef = { fg = "#F3F2CC", italic = true },
      
      -- Comments in gray (like autumn_night my_gray5)
      Comment = { fg = "#626C66", italic = true },
      
      -- Special elements
      Special = { fg = "#FAD566" }, -- my_yellow1
      SpecialChar = { fg = "#86c1b9" }, -- my_turquoise1
      Delimiter = { fg = "#F3F2CC" }, -- my_white1
      
      -- Member variables in brown (like autumn_night my_brown)
      ["@variable.member"] = { fg = "#cfba8b" },
      ["@property"] = { fg = "#cfba8b" },
      
      -- Keep autumn_night foreground
      ["@variable"] = { fg = "#F3F2CC" },
      ["@parameter"] = { fg = "#F3F2CC" },
      
      -- Constructor in yellow
      ["@constructor"] = { fg = "#FAD566" },
      
      -- Method calls in yellow
      ["@function.call"] = { fg = "#FAD566" },
      ["@function.method.call"] = { fg = "#FAD566" },
      
      -- Fix folder colors and neon yellow issues
      Directory = { fg = "#cfba8b" }, -- Use autumn_night brown for folders
      SnacksPickerDirectory = { fg = "#cfba8b" },
      SnacksPickerFile = { fg = "#F3F2CC" },
      
      -- Fix lazy.nvim and other UI yellow highlights
      LazyH1 = { fg = "#FAD566", bg = "#0d1011" }, -- Lazy titles
      LazyButton = { fg = "#F3F2CC", bg = "#1c1f20" },
      LazyButtonActive = { fg = "#0d1011", bg = "#cfba8b" },
      LazySpecial = { fg = "#cfba8b" },
      LazyReasonPlugin = { fg = "#99be70" },
      LazyReasonEvent = { fg = "#86c1b9" },
      LazyReasonKeys = { fg = "#86c1b9" },
      LazyReasonStart = { fg = "#F05E48" },
      LazyValue = { fg = "#F3F2CC" },
      LazyDir = { fg = "#cfba8b" },
      LazyUrl = { fg = "#86c1b9" },
      LazyCommit = { fg = "#99be70" },
      LazyNoCond = { fg = "#626C66" },
      
      -- Additional directory-related highlights
      ["@directory"] = { fg = "#cfba8b" },
      ["@file"] = { fg = "#F3F2CC" },
      
      -- Snacks dashboard (LazyVim's default splash screen)
      SnacksDashboardHeader = { fg = "#FAD566" }, -- Muted yellow for headers
      SnacksDashboardIcon = { fg = "#cfba8b" }, -- Brown for icons
      SnacksDashboardKey = { fg = "#86c1b9" }, -- Turquoise for key hints
      SnacksDashboardDesc = { fg = "#F3F2CC" }, -- White for descriptions
      SnacksDashboardFooter = { fg = "#626C66" }, -- Gray for footer
      SnacksDashboardTitle = { fg = "#FAD566" },
      SnacksDashboardSpecial = { fg = "#99be70" },
      
      -- Mini.starter (alternative splash screen)
      MiniStarterHeader = { fg = "#FAD566" },
      MiniStarterFooter = { fg = "#626C66" },
      MiniStarterItem = { fg = "#F3F2CC" },
      MiniStarterItemBullet = { fg = "#86c1b9" },
      MiniStarterItemPrefix = { fg = "#cfba8b" },
      MiniStarterSection = { fg = "#99be70" },
      MiniStarterQuery = { fg = "#F05E48" },
      
      -- Dashboard.nvim (another possible dashboard)
      DashboardHeader = { fg = "#FAD566" },
      DashboardCenter = { fg = "#F3F2CC" },
      DashboardShortcut = { fg = "#86c1b9" },
      DashboardFooter = { fg = "#626C66" },
      
      -- Fix markdown headings (replace neon yellow)
      ["@markup.heading.1.markdown"] = { fg = "#FAD566", bold = true }, -- H1 in muted yellow
      ["@markup.heading.2.markdown"] = { fg = "#F05E48", bold = true }, -- H2 in red (more distinct)
      ["@markup.heading.3.markdown"] = { fg = "#99be70", bold = true }, -- H3 in green
      ["@markup.heading.4.markdown"] = { fg = "#86c1b9", bold = true }, -- H4 in turquoise
      ["@markup.heading.5.markdown"] = { fg = "#cfba8b", bold = true }, -- H5 in brown
      ["@markup.heading.6.markdown"] = { fg = "#626C66", bold = true }, -- H6 in gray
      
      -- Fallback for older treesitter
      ["@text.title.1.markdown"] = { fg = "#FAD566", bold = true },
      ["@text.title.2.markdown"] = { fg = "#F05E48", bold = true },
      ["@text.title.3.markdown"] = { fg = "#99be70", bold = true },
      ["@text.title.4.markdown"] = { fg = "#86c1b9", bold = true },
      ["@text.title.5.markdown"] = { fg = "#cfba8b", bold = true },
      ["@text.title.6.markdown"] = { fg = "#626C66", bold = true },
      
      -- Traditional vim markdown headings
      markdownH1 = { fg = "#FAD566", bold = true },
      markdownH2 = { fg = "#F05E48", bold = true },
      markdownH3 = { fg = "#99be70", bold = true },
      markdownH4 = { fg = "#86c1b9", bold = true },
      markdownH5 = { fg = "#cfba8b", bold = true },
      markdownH6 = { fg = "#626C66", bold = true },
      
      -- Fix INSERT mode text in status line
      ModeMsg = { fg = "#F3F2CC" }, -- White instead of neon yellow
      MoreMsg = { fg = "#F3F2CC" },
    },
    dim_inactive = false,
    transparent_mode = false,
  },
  config = function(_, opts)
    require("gruvbox").setup(opts)
    vim.cmd.colorscheme("gruvbox")
  end,
}