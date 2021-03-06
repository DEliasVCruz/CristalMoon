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
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.menu = ({
        nvim_lsp = string.format("%s %s", vim_item.kind, "[LSP]"),
        nvim_lua = string.format("%s %s", vim_item.kind, "[LUA]"),
        rg = string.format("%s %s", vim_item.kind, "[RG]"),
        fuzzy_buffer = string.format("%s %s", vim_item.kind, "[FZF]"),
        luasnip = string.format("%s %s", vim_item.kind, "[SNIP]"),
        path = string.format("%s %s", vim_item.kind, "[PATH]"),
      })[entry.source.name]

      -- load lspkind icons
      vim_item.kind = require("core.completion.lspkind_icons").icons[vim_item.kind]

      return vim_item
    end,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert, { "i", "c", "s" } },
    ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert, { "i", "c", "s" } },
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c", "s" }),
    -- Not working with st window scroll mappings
    -- The `<A-u>` and `<A-d>` wouldn't work either
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c", "s" }),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c", "s" }),
    ["<C-k>"] = cmp.mapping.confirm { select = true },

    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },

    --[[ ["<C-x><C-s>"] = cmp.mapping.complete {
      config = {
        sources = {
          { name = "path" },
        },
      },
    }, ]]

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
  sources = {
    { name = "nvim_lua", group_index = 1, priority = 70 },
    { name = "nvim_lsp", group_index = 1, priority = 90 },
    { name = "luasnip", group_index = 1, priority = 80 },
    { name = "path", group_index = 2 },
    { name = "rg", keyword_length = 4, max_item_count = 5, group_index = 3 },
    { name = "fuzzy_buffer", keyword_length = 4, max_item_count = 5, group_index = 4 },
  },
  window = {
    documentation = {
      winhighlight = "NormalFloat:CmpDocWin",
      border = "single",
      max_width = 40,
      max_height = 20,
    },
    completion = {
      border = nil,
    },
  },
  experimental = {
    ghost_text = false,
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
    { name = "path" },
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
