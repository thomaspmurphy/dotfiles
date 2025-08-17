local M = {}

function M.setup_obsidian_keymaps()
  -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
  vim.keymap.set("n", "gf", function()
    return require("obsidian").util.gf_passthrough()
  end, { noremap = false, expr = true, buffer = true })

  -- Toggle check-boxes.
  vim.keymap.set("n", "<leader>ch", function()
    return require("obsidian").util.toggle_checkbox()
  end, { buffer = true })

  -- Smart action depending on context, either follow link or toggle checkbox.
  vim.keymap.set("n", "<cr>", function()
    return require("obsidian").util.smart_action()
  end, { buffer = true, expr = true })
end

function M.setup_markdown_settings()
  local opts = { buffer = true }
  
  -- Text editor-style settings for markdown
  -- Hard wrapping and text flow
  vim.opt_local.textwidth = 80          -- Wrap at 80 characters
  vim.opt_local.wrap = true             -- Visual wrapping
  vim.opt_local.linebreak = true        -- Break at word boundaries
  vim.opt_local.breakindent = true      -- Maintain indentation on wrapped lines
  vim.opt_local.showbreak = "↪ "        -- Show wrapped line indicator
  
  -- Formatting options for hard wrapping
  vim.opt_local.formatoptions:append("t")  -- Auto-wrap text using textwidth
  vim.opt_local.formatoptions:append("c")  -- Auto-wrap comments using textwidth
  vim.opt_local.formatoptions:append("r")  -- Auto-insert comment leader on Enter
  vim.opt_local.formatoptions:append("q")  -- Allow formatting comments with 'gq'
  vim.opt_local.formatoptions:append("n")  -- Recognize numbered lists
  vim.opt_local.formatoptions:append("j")  -- Remove comment leader when joining lines
  vim.opt_local.formatoptions:remove("o")  -- Don't auto-insert comment leader on 'o'/'O'
  
  -- Better text editing experience
  vim.opt_local.spell = true            -- Enable spell checking
  vim.opt_local.spelllang = "en_us"     -- Set spelling language
  vim.opt_local.conceallevel = 2        -- Hide markdown syntax when not editing
  vim.opt_local.concealcursor = "nc"    -- Don't conceal on cursor line in normal/command mode
  
  -- Softer scrolling and movement
  vim.opt_local.scrolloff = 3           -- Keep 3 lines visible above/below cursor
  vim.opt_local.sidescrolloff = 5       -- Keep 5 characters visible left/right
  
  -- Keybindings for text editing
  -- Format current paragraph
  vim.keymap.set("n", "gqp", "gqip", opts)
  
  -- Move by display lines instead of actual lines (for wrapped text)
  vim.keymap.set({"n", "v"}, "j", "gj", opts)
  vim.keymap.set({"n", "v"}, "k", "gk", opts)
  vim.keymap.set({"n", "v"}, "0", "g0", opts)
  vim.keymap.set({"n", "v"}, "$", "g$", opts)
  vim.keymap.set({"n", "v"}, "^", "g^", opts)
  
  -- Quick paragraph formatting
  vim.keymap.set("n", "<leader>gq", "gqip", { buffer = true, desc = "Format paragraph" })
  
  -- Toggle hard wrap for current paragraph
  vim.keymap.set("n", "<leader>tw", function()
    local tw = vim.opt_local.textwidth:get()
    if tw == 0 then
      vim.opt_local.textwidth = 80
      print("Text width set to 80")
    else
      vim.opt_local.textwidth = 0
      print("Text width disabled")
    end
  end, { buffer = true, desc = "Toggle text width" })
  
  -- Auto-format on paste in insert mode
  vim.keymap.set("i", "<C-v>", "<C-r>+gqq", opts)
end

function M.setup()
  -- Set up keymaps and settings for markdown files
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
      M.setup_obsidian_keymaps()
      M.setup_markdown_settings()
    end,
  })
end

return M