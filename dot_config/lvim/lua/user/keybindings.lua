local M = {}
M.config = function()
  if lvim.builtin.dap.active then
    lvim.builtin.which_key.mappings["de"] = { "<cmd>lua require('dapui').eval()<cr>", "Eval" }
    lvim.builtin.which_key.mappings["dU"] = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle UI" }
  end

  lvim.leader = "space"
  lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
  lvim.keys.normal_mode["<esc>"] = ":noh <cr>"

  vim.cmd("nnoremap j gj")
  vim.cmd("nnoremap k gk")
  vim.cmd("nnoremap Q <nop>")
  vim.cmd("nnoremap <silent> <c-l> :nohlsearch<cr><c-l>")


end

return M
