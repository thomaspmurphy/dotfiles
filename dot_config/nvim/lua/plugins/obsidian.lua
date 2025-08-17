local vim = vim

return {
  "obsidian-nvim/obsidian.nvim",
  -- tag = "*", -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "orb",
        path = "~/Documents/orb",
      },
      {
        name = "avva",
        path = "~/Documents/avva",
      },
      {
        name = "eniac",
        path = "~/Documents/eniac",
      },
      {
        name = "ekhe",
        path = "~/Documents/ekhe",
      },
    },

    daily_notes = {
      enabled = true,
      folder = "_journal",
      -- template = "+/templates/Daily Note Template.md",
    },

    -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
    completion = {
      nvim_comp = false,
      -- Set to false to disable completion.
      blink = true,
      -- Trigger completion at 2 chars.
      min_chars = 2,
    },

    -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
    -- way then set 'mappings = {}'.
    -- Keymaps are now handled separately - see config function below

    picker = {
      name = "snacks.pick",
      mappings = {
        new = "<C-x>",
        insert_link = "<C-l>",
      },
    },
  },
  config = function(_, opts)
    require("obsidian").setup(opts)
    
    -- Set up markdown configuration
    require("config.markdown").setup()

    -- Custom folder picker function
    local function create_folder_picker(client, folder_path, title)
      local picker = client:picker()
      if not picker then
        require("obsidian.log").err("No picker configured")
        return
      end

      local vault_path = opts.workspaces[1].path
      local full_path = vim.fn.fnamemodify(vault_path .. "/" .. folder_path, ":p")
      local files = vim.fn.glob(full_path .. "/*.md", true, true)

      local entries = {}
      for _, file in ipairs(files) do
        local display_name = vim.fn.fnamemodify(file, ":t:r")
        entries[#entries + 1] = {
          value = file,
          display = display_name,
          ordinal = display_name,
          filename = file,
        }
      end

      picker:pick(entries, {
        prompt_title = title,
        callback = function(file)
          vim.cmd.edit(file)
        end,
      })
    end

    -- Create the commands
    vim.api.nvim_create_user_command("ObsidianReading", function()
      local client = require("obsidian").get_client()
      create_folder_picker(client, "reading", "Reading Notes")
    end, {})

    vim.api.nvim_create_user_command("ObsidianListening", function()
      local client = require("obsidian").get_client()
      create_folder_picker(client, "listening", "Listening Notes")
    end, {})

    vim.api.nvim_create_user_command("ObsidianWriting", function()
      local client = require("obsidian").get_client()
      create_folder_picker(client, "_active", "Active Writing")
    end, {})
  end,
}
