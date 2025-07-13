return {
  "nvim-treesitter/nvim-treesitter", 
  branch = 'master', 
  lazy = false, 
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config = {
      ensure_installed = {
        "lua",
        "cpp",
        "python"
      },
      highlight = { enable=true },
      indent = { enable=true },
    }
  end
} 
