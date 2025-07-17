return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup()

    vim.keymap.set('n', "<leader>gph", ":Gitsigns preview_hunk<CR>", {})
    vim.keymap.set('n', "<leader>gdt", ":Gitsigns diffthis<CR>", {})
  end
}
