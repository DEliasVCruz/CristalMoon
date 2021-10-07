local present, cmp = pcall(require, "cmp")

if not present then
	return
end

-- vim.opt.pumblend = 20

-- nvim-cmp setup
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	formatting = {
		format = function(entry, vim_item)
			-- load lspkind icons
			vim_item.kind = string.format(
				"%s %s",
				require("core.completion.lspkind_icons").icons[vim_item.kind],
				vim_item.kind
			)

			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				nvim_lua = "[Lua]",
				buffer = "[BUF]",
			})[entry.source.name]

			return vim_item
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Insert,
		}),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		{ name = "path" },
	},
})
-- Mappings
-- Esc from insert mode
-- vim.api.nvim_set_keymap("i", "jk", "<ESC>", { noremap = true })

-- Movement in insert mode
vim.api.nvim_set_keymap("i", "<C-j>", "<Left>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-k>", "<Right>", { noremap = true })

-- Undo break points
vim.api.nvim_set_keymap("i", ",", ",<c-g>u", { noremap = true })
vim.api.nvim_set_keymap("i", ".", ".<c-g>u", { noremap = true })
vim.api.nvim_set_keymap("i", "!", "!<c-g>u", { noremap = true })
vim.api.nvim_set_keymap("i", "?", "?<c-g>u", { noremap = true })
vim.api.nvim_set_keymap("i", "=", "=<c-g>u", { noremap = true })
vim.api.nvim_set_keymap("i", '"', '"<c-g>u', { noremap = true })

-- Paste mapping
vim.api.nvim_set_keymap("i", "<C-v>", '<C-r>"', { noremap = true })
vim.api.nvim_set_keymap("i", "<C-y>", "<C-r>+", { noremap = true })

-- Indentation
vim.api.nvim_set_keymap("i", "<C-o>", "<C-t>", { noremap = true })

-- Compe confirm & close
vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", { noremap = true, silent = true, expr = true })

-- Capitalization
-- vim.api.nvim_set_keymap("i", "<C-t>", "<esc>b~ea", { noremap = true })
