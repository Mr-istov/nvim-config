local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "NvChad/nvterm",
    opts = overrides.nvterm,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "simrat39/rust-tools.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
    },
    event = "BufEnter *.rust",
    config = function()
      require "custom.configs.rust-tools"
    end,
  },

  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.nvim-dap"
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require "custom.configs.nvim-dap-ui"
    end,
  },

  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    event = "BufEnter",
    config = function()
      require "custom.configs.hop"
    end,
  },

  {
    "folke/todo-comments.nvim",
    event = "BufEnter",
    config = function()
      require "custom.configs.todo-comments"
    end,
  },

  {
    "okuuva/auto-save.nvim",
    event = "BufEnter",
    config = function()
      require "custom.configs.auto-save"
    end,
  },
}

return plugins
