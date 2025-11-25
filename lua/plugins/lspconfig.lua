return {
	"neovim/nvim-lspconfig",
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")
    capabilities.offsetEncoding = { "utf-8" }

		-- Setup Language Servers
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
		})
		lspconfig.clangd.setup({
			capabilities = capabilities,
			cmd = { "clangd", "--compile-commands-dir=Build" },
		})

		-- Setup Keymaps
		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		vim.keymap.set(
			"n",
			"<leader>a",
			require("telescope.builtin").lsp_document_symbols,
			{ desc = "List symbols in file" }
		)

		-- 🧠 ADD diagnostic UI config here:
		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})

		-- Optional: show diagnostics on hover
		vim.api.nvim_create_autocmd("CursorHold", {
			callback = function()
				vim.diagnostic.open_float(nil, { focus = false })
			end,
		})
	end,
}
