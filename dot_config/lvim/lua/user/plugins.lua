-- Additional Plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
local M = {}

M.config = function()

  lvim.plugins = {
    { "folke/tokyonight.nvim" },
    { "sainnhe/everforest" },
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },
    {
      "ggandor/leap.nvim",
      config = function()
        require('leap').set_default_keymaps()
      end,
    },
    -- {
    --   "phaazon/hop.nvim",
    --   event = "BufRead",
    --   config = function()
    --     require("hop").setup()
    --     -- vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
    --     vim.api.nvim_set_keymap("n", "s", ":HopWord<cr>", { silent = true })
    --   end,
    -- },
    {
      "tpope/vim-surround",

      -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
      -- setup = function()
      --  vim.o.timeoutlen = 500
      -- end
    },
    {
      'theHamsta/nvim-dap-virtual-text',
    },
    {
      "mfussenegger/nvim-dap-python",
      config = function()
        require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
        require('dap.ext.vscode').load_launchjs()
      end,
    },
    { "leoluz/nvim-dap-go", module = "dap-go" },
    { "ray-x/go.nvim",
      config = function()
        require('go').setup()
      end,
    },
    {
      "rcarriga/nvim-dap-ui",
      config = function()
        require("dapui").setup()
      end,
      ft = { "python", "rust", "go" },
      event = "BufReadPost",
      requires = { "mfussenegger/nvim-dap" },
      disable = not lvim.builtin.dap.active,
    },
  }

end

return M
