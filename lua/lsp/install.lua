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
    ensure_installed = { "lua_ls", "vimls", "tailwindcss" },
    automatic_installation = true,
  }
end

M.setup = function()
  -- Using new Neovim 0.11+ vim.lsp.config API
  -- Note: jdtls is NOT in this list - it's handled by nvim-java plugin
  local servers = {
    "lua_ls",
    "bashls",
    "volar",
    "tailwindcss",
    "terraformls",
    "cssls",
    "clangd",
    "html",
    "taplo",
    "texlab",
    "vimls",
    "yamlls",
    "pyright",
    "gopls",
    "tsserver",
  }

  -- Get vue-language-server path if installed (for tsserver integration)
  local vue_language_server_path = ""
  local ok, mason_registry = pcall(require, "mason-registry")

  if ok then
    local vue_pkg_name = "vue-language-server"
    if mason_registry.is_installed(vue_pkg_name) then
      local pkg = mason_registry.get_package(vue_pkg_name)
      -- Try different API methods (Mason API has changed across versions)
      vue_language_server_path = (pkg.get_install_dir and pkg:get_install_dir())
        or (pkg.get_install_path and pkg:get_install_path())
        or ""
      if vue_language_server_path ~= "" then
        vue_language_server_path = vue_language_server_path .. "/node_modules/@vue/language-server"
      end
    end
  end

  local attach = require("lsp").attach

  -- Tell lsp about nvim-cmp
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("lsp").capabilities(capabilities)

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

  -- Setup tsserver with Vue plugin if available
  local tsserver_config = {
    capabilities = capabilities,
    on_attach = attach,
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
    flags = {
      debounce_text_changes = 150,
    },
  }

  if vue_language_server_path ~= "" then
    tsserver_config.init_options = {
      plugins = {
        {
          name = "@vue/typescript-plugin",
          location = vue_language_server_path,
          languages = { "vue" },
        },
      },
    }
  end

  vim.lsp.config("tsserver", tsserver_config)

  -- Volar setup
  vim.lsp.config("volar", {
    capabilities = capabilities,
    on_attach = attach,
  })

  -- Note: JDTLS config is handled by nvim-java plugin, not here

  -- Lua LS setup with specific settings
  vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    on_attach = attach,
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
    settings = {
      pyright = {
        analysis = {
          useLibraryCodeForTypes = true,
        },
        disableOrganizeImports = true,
      },
    },
  })

  -- Gopls setup
  vim.lsp.config("gopls", {
    capabilities = capabilities,
    on_attach = attach,
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
    settings = {
      html = {
        format = {
          templating = true,
        },
      },
    },
  })

  -- Auto-enable LSP for configured servers
  -- Note: In Neovim 0.11+, LSP servers are automatically enabled when you open matching files
  -- You can also manually enable with: vim.lsp.enable(server_name)
end

return M
