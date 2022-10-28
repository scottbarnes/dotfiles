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
        require('go').setup({
            goimport = 'gopls', -- if set to 'gopls' will use golsp format
            gofmt = 'gopls', -- if set to gopls will use golsp format
            max_line_len = 120,
            tag_transform = false,
            test_dir = '',
            comment_placeholder = '   ',
            lsp_cfg = true, -- false: use your own lspconfig
            lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
            lsp_on_attach = true, -- use on_attach from go.nvim
            dap_debug = true,
        })
        -- Run gofmt + goimport on save
        vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
      end,
    },
    { 'ray-x/guihua.lua',
    config = function()
      require('guihua.maps').setup({
        maps = {
          close_view = '<C-x>',
        }
      })
      end,},
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
