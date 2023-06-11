local M = {}

M.config = function()
  require("mason").setup {
    ui = {
      icons = {
        package_installed = "ﲏ ",
        package_pending = " ",
        package_uninstalled = "✗",
      },
    },
  }
  require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "vimls", "tailwindcss" },
    automatic_installation = true,
  }
end

M.setup = function()
  local lspconf = require "lspconfig"
  local servers = {
    "lua_ls",
    "bashls",
    "volar",
    "tailwindcss",
    "terraformls",
    -- "emmet_ls",
    "html",
    "taplo",
    "texlab",
    "vimls",
    "yamlls",
    "pyright",
    -- "jsonls",
    "gopls",
    -- "tsserver",
  }

  local attach = require("lsp").attach

  -- Tell lsp about nvim-cmp
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("lsp").capabilities(capabilities)

  for _, server in pairs(servers) do
    lspconf[server].setup {
      on_attach = attach,
      capabilities = capabilities,
      flags = {
        -- This will be the default in neovim 0.7+
        debounce_text_changes = 150,
      },
    }
  end

  require("lspconfig").volar.setup {
    on_new_config = function(new_config, new_root_dir)
      new_config.init_options.typescript.tsdk = require("lsp").get_typescript_server_path(new_root_dir)
    end,
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
  }

  lspconf.lua_ls.setup {
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
        memoryMode = "DegradeClosed",
      },
    },
    init_options = {
      usePlaceholders = true,
      completeUnimported = true,
    },
  }

  -- lspconf.jsonls.setup = {
  --   settings = {
  --     json = {
  --       format = {
  --         enable = false,
  --         schemas = require("schemastore").json.schemas(),
  --       },
  --     },
  --   },
  --   init_options = {
  --     provideFormatter = false,
  --   },
  -- }
end

return M
