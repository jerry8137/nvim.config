vim.opt.conceallevel = 1
require("obsidian").setup({
  workspaces = {
    {
      name = "work",
      path = "~/myObsidian",
    },
  },
  daily_notes = {
    folder = "daily",
    date_format = "%Y-%m-%d",
    alias_format = "%B %-d, %Y",
    template = "daily.md",
  },
  templates = {
    subdir = "templates",
    date_format = "%Y-%m-%d-%a",
    time_format = "%H:%M",
  },
})

vim.keymap.set("n", "<leader>op", vim.cmd.ObsidianOpen);
vim.keymap.set("n", "<leader>of", vim.cmd.ObsidianFollowLink);
