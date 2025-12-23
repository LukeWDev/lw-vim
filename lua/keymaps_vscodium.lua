local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- keymap("n", "<>", "<cmd>lua require('vscode').action('')<CR>", opts)

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

-- toggle explorer
keymap("n", "<leader>se", "<cmd>lua require('vscode').action('workbench.action.toggleSidebarVisibility')<CR>", opts)

-- toggle output panel
keymap("n", "<leader>so", "<cmd>lua require('vscode').action('workbench.action.togglePanel')<CR>", opts)

-- split editor views
keymap("n", "<leader>sv", "<cmd>lua require('vscode').action('workbench.action.splitEditorRight')<CR>", opts)
keymap("n", "<leader>sh", "<cmd>lua require('vscode').action('workbench.action.splitEditorDown')<CR>", opts)

-- toggle code diff
keymap("n", "<leader>sd", "<cmd>lua require('vscode').action('git.openChange')<CR>", opts)
keymap("n", "<leader>cd", "<cmd>lua require('vscode').action('git.openFile')<CR>", opts)

-- find file
keymap("n", "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>", opts)

-- find text
keymap("n", "<leader>fg", "<cmd>lua require('vscode').action('filesExplorer.findInWorkspace')<CR>", opts)

-- navigate editor views
keymap("n", "<C-k>", "<cmd>lua require('vscode').action('workbench.action.focusAboveGroup')<CR>", opts)
keymap("n", "<C-j>", "<cmd>lua require('vscode').action('workbench.action.focusBelowGroup')<CR>", opts)
keymap("n", "<C-l>", "<cmd>lua require('vscode').action('workbench.action.focusRightGroup')<CR>", opts)
keymap("n", "<C-h>", "<cmd>lua require('vscode').action('workbench.action.focusLeftGroup')<CR>", opts)

-- show hover
keymap({"n", "v"}, "<leader>i", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>", opts)

-- toggle breakpoint
keymap({"n", "v"}, "<leader>db", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>", opts)

-- start debugging
keymap({"n", "v"}, "<leader>dr", "<cmd>lua require('vscode').action('workbench.action.debug.start')<CR>")

-- show hover
keymap({"n", "v"}, "<leader>i", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>", opts)

-- document symbols
keymap({"n", "v"}, "<leader>a", "<cmd>lua require('vscode').action('workbench.action.gotoSymbol')<CR>", opts)

-- quick fix
keymap({"n", "v"}, "<leader>ca", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>", opts)

-- build
keymap({"n", "v"}, "<leader>cb", "<cmd>lua require('vscode').action('cmake.build')<CR>", opts)

-- open header/source
keymap({"n", "v"}, "<leader>o", "<cmd>lua require('vscode').action('clangd.switchheadersource')<CR>", opts)

-- go to definition
keymap({"n", "v"}, "<leader>gd", "<cmd>lua require('vscode').action('editor.action.revealDefinition')<CR>", opts)

-- go to declaration
keymap({"n", "v"}, "<leader>gc", "<cmd>lua require('vscode').action('editor.action.revealDeclaration')<CR>", opts) 

-- return from definition
keymap({"n", "v"}, "<leader>rd", "<cmd>lua require('vscode').action('workbench.action.navigateBack')<CR>", opts)
