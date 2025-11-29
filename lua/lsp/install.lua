local M = {}

M.config = function()
  require("mason").setup {
    ui = {
      icons = {
        package_installed = "ﲏ ",
        package_pending = " ",
        package_uninstalled = "✗",
      },
    },
  }
  require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "vimls" },
    automatic_installation = true,
  }
end

M.setup = function()
  -- Using new Neovim 0.11+ vim.lsp.config API
  -- Note: jdtls is NOT in this list - it's handled by nvim-java plugin
  local servers = {
    "bashls",
    "tailwindcss",
    "terraformls",
    "cssls",
    "clangd",
    "html",
    "taplo",
    "texlab",
    "vimls",
    "yamlls",
    "vue_ls",
  }

  local lsp = require "lsp"
  local attach = lsp.attach

  -- Tell lsp about nvim-cmp
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = lsp.capabilities(capabilities)

  -- Setup basic configuration for all servers
  for _, server in pairs(servers) do
    vim.lsp.config(server, {
      capabilities = capabilities,
      on_attach = attach,
      flags = {
        debounce_text_changes = 150,
      },
    })
  end

  -- Lua LS setup with specific settings
  vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    on_attach = attach,
    flags = {
      debounce_text_changes = 150,
    },
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  })

  -- Pyright setup
  vim.lsp.config("pyright", {
    capabilities = capabilities,
    on_attach = attach,
    flags = {
      debounce_text_changes = 150,
    },
    settings = {
      pyright = {
        analysis = {
          useLibraryCodeForTypes = true,
        },
        disableOrganizeImports = true,
      },
    },
  })

  vim.lsp.config("jdtls", {
    capabilities = capabilities,
    on_attach = attach,
    flags = {
      debounce_text_changes = 150,
    },
    settings = {
      java = {
        semanticTokens = false,
        capabilities = {
          textDocument = {
            semanticTokens = {
              augmentsSyntaxTokens = false,
              dynamicRegistration = false,
              formats = { "relative" },
              multilineTokenSupport = false,
              overlappingTokenSupport = true,
              requests = {
                full = {
                  delta = true,
                },
                range = false,
              },
              serverCancelSupport = false,
              tokenModifiers = {
                "declaration",
                "definition",
                "readonly",
                "static",
                "deprecated",
                "abstract",
                "async",
                "modification",
                "documentation",
                "defaultLibrary",
              },
              tokenTypes = {
                "namespace",
                "type",
                "class",
                "enum",
                "interface",
                "struct",
                "typeParameter",
                "parameter",
                "variable",
                "property",
                "enumMember",
                "event",
                "function",
                "method",
                "macro",
                "keyword",
                "modifier",
                "comment",
                "string",
                "number",
                "regexp",
                "operator",
                "decorator",
              },
            },
          },
        },
        configuration = {
          runtimes = {
            {
              name = "JavaSE-17",
              path = "/home/danielv/.local/share/mise/installs/java/17.0.2",
              default = false,
            },
            {
              name = "JavaSE-25",
              path = "/home/danielv/.local/share/mise/installs/java/25.0.0",
              default = false,
            },
            {
              name = "JavaSE-25",
              path = "/home/danielv/.local/share/mise/installs/java/temurin-25.0.0+36.0.LTS",
              default = true,
            },
          },
        },
        compile = {
          nullAnalysis = {
            mode = "automatic",
          },
        },
        eclipse = {
          downloadSources = true,
        },
        maven = {
          downloadSources = true,
        },
        implementationsCodeLens = {
          enabled = true,
        },
        referencesCodeLens = {
          enabled = true,
        },
        format = {
          enabled = true,
        },
      },
    },
  })

  -- Gopls setup
  vim.lsp.config("gopls", {
    capabilities = capabilities,
    on_attach = attach,
    flags = {
      debounce_text_changes = 150,
    },
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
  })

  -- HTML setup
  vim.lsp.config("html", {
    capabilities = capabilities,
    on_attach = attach,
    flags = {
      debounce_text_changes = 150,
    },
    filetypes = { "html", "htmldjango", "htmlliquid" },
    settings = {
      html = {
        format = {
          templating = true,
        },
      },
    },
  })

  -- Get vue-language-server path if installed (for tsserver integration)
  local vue_language_server_path = vim.fn.stdpath "data"
    .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
  local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }

  local vue_plugin = {
    name = "@vue/typescript-plugin",
    location = vue_language_server_path,
    languages = { "vue" },
    configNamespace = "typescript",
  }

  vim.lsp.config("vtsls", {
    capabilities = capabilities,
    on_attach = attach,
    flags = {
      debounce_text_changes = 150,
    },
    settings = {
      vtsls = {
        tsserver = {
          globalPlugins = {
            vue_plugin,
          },
        },
      },
    },
    filetypes = tsserver_filetypes,
  })
end

return M
