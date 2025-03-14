return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  'navarasu/onedark.nvim',
  'folke/tokyonight.nvim',
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  'nvim-treesitter/playground',
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  'mbbill/undotree',
  'tpope/vim-fugitive',
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
    }
  },
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
  },
  'lewis6991/gitsigns.nvim',
  'terrortylor/nvim-comment',
  'lukas-reineke/indent-blankline.nvim',
  {
    "David-Kunz/gen.nvim",
    opts = {
      model = "llama3.1", -- The default model to use.
    }
  },
  {
    "mistricky/codesnap.nvim",
    build = "make",
    config = function()
      require("codesnap").setup({
        mac_window_bar = true,
        title = "CodeSnap.nvim",
        code_font_family = "CaskaydiaCove Nerd Font",
        watermark_font_family = "Pacifico",
        watermark = "",
        bg_theme = "default",
        breadcrumbs_separator = "/",
        has_breadcrumbs = true,
        has_line_number = true,
        show_workspace = false,
        min_width = 0,
        bg_x_padding = 0,
        bg_y_padding = 0,
        save_path = os.getenv("XDG_PICTURES_DIR") or (os.getenv("HOME") .. "/Pictures")
      })
    end
  },
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      view_options = {
        show_hidden = true,
      },
      float = {
        max_width = 0.5,
        max_height = 0.7,
      }
    },
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false,
  },
}
