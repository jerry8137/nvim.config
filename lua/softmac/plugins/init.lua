return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  'navarasu/onedark.nvim',
  'folke/tokyonight.nvim',
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/playground',
  'theprimeagen/harpoon',
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
    'epwalsh/obsidian.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    "github/copilot.vim"
  },
  {
    "frankroeder/parrot.nvim",
    dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
    opts = {
      providers = {
        anthropic = {
          api_key = os.getenv("ANTHROPIC_API_KEY"),
          endpoint = "https://api.anthropic.com/v1/messages",
          topic_prompt = "You only respond with 3 to 4 words to summarize the past conversation.",
          -- usually a cheap and fast model to generate the chat topic based on
          -- the whole chat history
          topic = {
            model = "claude-3-haiku-20240307",
            params = { max_tokens = 32 },
          },
          -- default parameters for the actual model
          params = {
            chat = { max_tokens = 4096 },
            command = { max_tokens = 4096 },
          },
        }
      }
    }
  }
}
