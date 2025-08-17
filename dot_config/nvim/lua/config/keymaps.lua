-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Obsidian-related keymaps
map("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { noremap = true, silent = true, desc = "ObsidianOpen" })
map(
  "n",
  "<leader>oq",
  "<cmd>ObsidianQuickSwitch<CR>",
  { noremap = true, silent = true, desc = "Obsidian quick switch." }
)
map("n", "<leader>oj", "<cmd>ObsidianToday<CR>", { noremap = true, silent = true, desc = "Open daily note." })
map("n", "<leader>oy", "<cmd>ObsidianYesterday<CR>", { noremap = true, silent = true, desc = "Open yesterday's note." })
map(
  "n",
  "<leader>od",
  "<cmd>ObsidianDailies<CR>",
  { noremap = true, silent = true, desc = "Open a picker with recent journal notes." }
)
map("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { noremap = true, silent = true, desc = "Search vault." })
map("n", "<leader>oe", "<cmd>ObsidianExtractNote<CR>", { noremap = true, silent = true, desc = "Extract a note." })
map("n", "<leader>on", "<cmd>ObsidianNew<CR>", { noremap = true, silent = true, desc = "Make a note." })
map("n", "<leader>ot", "<cmd>ObsidianTags<CR>", { noremap = true, silent = true, desc = "Browse tags." })
map(
  "n",
  "<leader>or",
  "<cmd>ObsidianReading<CR>",
  { noremap = true, silent = true, desc = "Search for reading notes." }
)
map(
  "n",
  "<leader>ow",
  "<cmd>ObsidianWriting<CR>",
  { noremap = true, silent = true, desc = "Search for writing notes." }
)
map(
  "n",
  "<leader>ol",
  "<cmd>ObsidianListening<CR>",
  { noremap = true, silent = true, desc = "Search for listening notes." }
)
map("n", "<leader>ov", "<cmd>ObsidianWorkspace<CR>", { noremap = true, desc = "Switch vault." })
-- Pane navigation using <leader> + arrow keys
map("n", "<leader><Left>", "<C-w>h", { noremap = true, silent = true, desc = "Go to left pane" })
map("n", "<leader><Right>", "<C-w>l", { noremap = true, silent = true, desc = "Go to right pane" })
map("n", "<leader><Up>", "<C-w>k", { noremap = true, silent = true, desc = "Go to upper pane" })
map("n", "<leader><Down>", "<C-w>j", { noremap = true, silent = true, desc = "Go to lower pane" })

map("n", "<leader>cpd", "<cmd>Copilot disable<CR>", { noremap = true, silent = true, desc = "Copilot disable" })
map("n", "<leader>z", "<cmd>ZenMode<CR>", { noremap = true, silent = true, desc = "Zen mode" })
