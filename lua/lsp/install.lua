local M = {}

M.config = function()
  require("nvim-lsp-installer").settings {
    ui = {
      icons = {
        server_installed = "ﲏ ",
        server_pending = " ",
        server_uninstalled = "✗",
      },
    },
  }
end

M.setup_lsp = function(attach)
  local lsp_installer = require "nvim-lsp-installer"

  -- Tell lsp about nvim-cmp
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

  lsp_installer.on_server_ready(function(server)
    local opts = {
      on_attach = attach,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },
      settings = {},
      init_options = {},
      filetypes = {},
    }

    if server.name == "pyright" then
      opts.settings = {
        pyright = {
          analysis = {
            useLibraryCodeForTypes = true,
          },
          disableOrganizeImports = true,
        },
      }
    end

    if server.name == "gopls" then
      opts.settings = {
        gopls = {
          analysis = {
            unusedparams = true,
          },
          staticcheck = true,
        },
      }
      opts.init_options = {
        usePlaceholders = true,
        completeUnimported = true,
      }
    end

    if server.name == "bashls" then
      opts.filetypes = { "sh", "zsh" }
    end

    if server.name == "texlab" then
      opts.settings = {
        latex = {
          build = {
            onSave = true,
            forwardSearchAfter = true,
          },
          forwardSearch = {
            executable = "zathura",
          },
        },
      }
    end

    if server.name == "jsonls" then
      opts.init_options = {
        provideFormatter = false,
      }
    end

    if server.name == "tsserver" then
      opts.on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        attach(client, bufnr)
      end
    end

    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
  end)
end

return M
