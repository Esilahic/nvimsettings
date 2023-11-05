local plugins = {
	{
	  "williamboman/mason.nvim",
	  opts = {
		ensure_installed = {
		"gopls",
        "clangd",
        "clang-format",
        "codelldb",
		},
	  },
	},
	{
	  "mfussenegger/nvim-dap",
	  init = function()
		require("core.utils").load_mappings("dap")
	  end
	},
	{
	  "dreamsofcode-io/nvim-dap-go",
	  ft = "go",
	  dependencies = "mfussenegger/nvim-dap",
	  config = function(_, opts)
		require("dap-go").setup(opts)
		require("core.utils").load_mappings("dap_go")
	  end
	},
	{
	  "neovim/nvim-lspconfig",
	  config = function()
		require "plugins.configs.lspconfig"
		require "custom.configs.lspconfig"
	  end,
	},
	{
	  "nvimtools/none-ls.nvim",
	    event = "VeryLazy",
	  opts = function()
		return require "custom.configs.null-ls"
	  end,
	},
	{
	  "olexsmir/gopher.nvim",
	  ft = "go",
	  config = function(_, opts)
		require("gopher").setup(opts)
		require("core.utils").load_mappings("gopher")
	  end,
	  build = function()
		vim.cmd [[silent! GoInstallDeps]]
	  end,
	},
{
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
    {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {}
    },
  },
  }
  return plugins
