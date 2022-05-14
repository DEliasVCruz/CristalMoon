local M = {}

M.config = function()
  require("nvim-lsp-installer").setup {
    ensure_installed = { "sumneko_lua", "vimls" },
    automatic_installation = true,
    ui = {
      icons = {
        server_installed = "ﲏ ",
        server_pending = " ",
        server_uninstalled = "✗",
      },
    },
  }
end

M.setup = function()
  local lspconf = require "lspconfig"
  local servers = {
    -- "sumneko_lua",
    "bashls",
    "emmet_ls",
    "html",
    "taplo",
    "texlab",
    "vimls",
    "yamlls",
    "pyright",
    "jsonls",
    "gopls",
    "tsserver",
  }

  local attach = require("lsp").attach

  -- Tell lsp about nvim-cmp
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("lsp").capabilities(capabilities)

  for _, server in pairs(servers) do
    lspconf[server].setup {
      -- on_attach = attach,
      -- capabilities = capabilities,
      flags = {
        -- This will be the default in neovim 0.7+
        debounce_text_changes = 150,
      },
    }
  end

  lspconf.sumneko_lua.setup {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  }

  lspconf.pyright.setup {
    settings = {
      pyright = {
        analysis = {
          useLibraryCodeForTypes = true,
        },
        disableOrganizeImports = true,
      },
    },
  }

  lspconf.gopls.setup = {
    settings = {
      gopls = {
        analysis = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
    init_options = {
      usePlaceholders = true,
      completeUnimported = true,
    },
  }

  lspconf.jsonls.setup = {
    settings = {
      json = {
        format = {
          enable = false,
          schemas = require("schemastore").json.schemas(),
        },
      },
    },
    init_options = {
      provideFormatter = false,
    },
  }
  lspconf.tsserver.setup {
    on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
      attach(client, bufnr)
    end,
  }
end

return M
