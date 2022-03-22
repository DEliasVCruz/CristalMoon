local present, cmp = pcall(require, "cmp")

if not present then
  return
end

local ok, luasnip = pcall(require, "luasnip")
if not ok then
  return
end

-- Pmenu options
vim.opt.completeopt = "menuone,noselect"
vim.opt.pumheight = 7 -- Makes popup menu smaller

-- nvim-cmp setup
cmp.setup {
  --[[ fields = {
    cmp.ItemField.Kind,
    cmp.ItemField.Abbr,
    cmp.ItemField.Menu,
  }, ]]
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  formatting = {
    format = function(entry, vim_item)
      -- load lspkind icons
      vim_item.kind = string.format("%s", require("core.completion.lspkind_icons").icons[vim_item.kind], vim_item.kind)

      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        nvim_lua = "[LUA]",
        rg = "[RG]",
        fuzzy_buffer = "[FZF]",
        luasnip = "[SNIP]",
        fuzzy_path = "[PATH]",
      })[entry.source.name]

      return vim_item
    end,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert, { "i", "c", "s" } },
    ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert, { "i", "c", "s" } },
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c", "s" }),
    ["<A-j>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c", "s" }),
    ["<A-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c", "s" }),
    ["<C-k>"] = cmp.mapping.confirm { select = true },

    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },

    ["<C-l>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
        --[[ elseif neogen.jumpable() then
				vim.fn.feedkeys(t("<cmd>lua require('neogen').jump_next()<CR>"), "") ]]
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<C-t>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
        -- vim.api.nvim_input("<C-d>")
        --[[ elseif neogen.jumpable(-1) then
				vim.fn.feedkeys(t("<cmd>lua require('neogen').jump_prev()<CR>"), "") ]]
			else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = cmp.config.sources {
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "fuzzy_path" },
    { name = "rg", keyword_length = 4, max_item_count = 5 },
    { name = "fuzzy_buffer", keyword_length = 5, max_item_count = 5 },
  },
  experimental = {
    ghost_text = false,
  },
  documentation = {
    border = "single",
    winhighlight = "NormalFloat:CmpDocWin",
  },
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      require("cmp-under-comparator").under,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
}

cmp.setup.cmdline("/", {
  sources = cmp.config.sources {
    { name = "fuzzy_buffer" },
  },
})

cmp.setup.cmdline(":", {
  sources = cmp.config.sources({
    { name = "fuzzy_path" },
  }, {
    { name = "cmdline" },
  }),
})

-- Mappings
-- Undo break points
vim.keymap.set("i", ",", ",<c-g>u", { noremap = true })
vim.keymap.set("i", ".", ".<c-g>u", { noremap = true })
vim.keymap.set("i", "!", "!<c-g>u", { noremap = true })
vim.keymap.set("i", "?", "?<c-g>u", { noremap = true })
vim.keymap.set("i", "=", "=<c-g>u", { noremap = true })
vim.keymap.set("i", '"', '"<c-g>u', { noremap = true })

-- Paste mapping
vim.keymap.set("i", "<C-v>", '<C-r>"', { noremap = true })
vim.keymap.set("i", "<C-y>", "<C-r>+", { noremap = true })

-- Indentation
vim.keymap.set("i", "<C-o>", "<C-t>", { noremap = true })

-- Signature help
vim.keymap.set("i", "<C-s>", function()
  vim.lsp.buf.signature_help()
end, { buffer = true, noremap = true, silent = true })
