local M = {}

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

    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
  end)
end

return M
