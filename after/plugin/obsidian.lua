vim.opt.conceallevel = 1
require("obsidian").setup({
  workspaces = {
    {
      name = "work",
      path = "~/myObsidian",
    },
  },
  -- see below for full list of options 👇
  daily_notes = {
    -- Optional, if you keep daily notes in a separate directory.
    folder = "daily",
    -- Optional, if you want to change the date format for the ID of daily notes.
    date_format = "%Y-%m-%d",
    -- Optional, if you want to change the date format of the default alias of daily notes.
    alias_format = "%B %-d, %Y",
    -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
    template = "daily.md",
  },
  templates = {
    -- Optional, if you want to change the default template directory.
    subdir = "templates",
    date_format = "%Y-%m-%d-%a",
    time_format = "%H:%M",
  },
})

vim.keymap.set("n", "<leader>op", vim.cmd.ObsidianOpen);
vim.keymap.set("n", "<leader>of", vim.cmd.ObsidianFollowLink);
