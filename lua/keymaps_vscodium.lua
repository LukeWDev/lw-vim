local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Yank to System Clipboard
keymap({"n", "v"}, "<leader>y", '"+y', opts)

-- Indent Handling
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Remove Highlighting when ESC
keymap("n", "<Esc>", "<Esc>:noh<CR>", opts)

-- Layout
--vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", opts)
--vim.keymap.set("n", "<leader>sh", ":split<CR>", opts)
--vim.keymap.set('n', '<A-h>', '<C-w>h', opts) -- Move to Left Split
--vim.keymap.set('n', '<A-j>', '<C-w>j', opts) -- Move to Bottom Split
--vim.keymap.set('n', '<A-k>', '<C-w>k', opts) -- Move to Top Split
--vim.keymap.set('n', '<A-l>', '<C-w>l', opts) -- Move to Right Split

-- Code Specific
    -- Debug
keymap({"n", "v"}, "<leader>db", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")
keymap({"n", "v"}, "<leader>dr", "") -- debug run

    -- 
keymap({"n", "v"}, "<leader>i", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")
keymap({"n", "v"}, "<leader>a", "") -- document symbols
keymap({"n", "v"}, "<leader>ca", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
keymap({"n", "v"}, "<leader>o", "") -- open header/source
keymap({"n", "v"}, "<leader>gd", "<cmd>lua require('vscode').action('editor.action.revealDefinition')<CR>") -- go to definition
keymap({"n", "v"}, "<leader>rd", "<cmd>lua require('vscode').action('workbench.action.navigateBack')<CR>") -- return from definition
