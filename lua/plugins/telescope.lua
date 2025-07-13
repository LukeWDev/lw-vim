return {
  'nvim-telescope/telescope.nvim',
  tag = '-2.1.8', 
  branch = '-2.1.x',
  dependencies = { 
    'nvim-lua/plenary.nvim', 
  },
  config = function()
    local builtin  = require("telescope.builtin")
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
  end
}
