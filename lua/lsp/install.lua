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
    "cssls",
    -- "emmet_ls",
    "html",
    "taplo",
    "texlab",
    "vimls",
    "yamlls",
    "pyright",
    -- "jsonls",
    "gopls",
    "tsserver",
  }

  local mason_registry = require "mason-registry"
  local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
    .. "/node_modules/@vue/language-server"

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

  lspconf.tsserver.setup {
    init_options = {
      plugins = {
        {
          name = "@vue/typescript-plugin",
          location = vue_language_server_path,
          languages = { "vue" },
        },
      },
    },
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  }

  -- No need to set `hybridMode` to `true` as it's the default value
  lspconf.volar.setup {}

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

  lspconf.gopls.setup {
    settings = {
      gopls = {
        semanticTokens = true,
        analyses = {
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

  lspconf.html.setup {
    settings = {
      html = {
        format = {
          templating = true,
        },
      },
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
