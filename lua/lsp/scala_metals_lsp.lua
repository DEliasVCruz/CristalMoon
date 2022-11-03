local M = {}

M.config = function()
  ScalaMetals = require("metals").bare_config()

  -- Example of settings
  ScalaMetals.settings = {
    showImplicitArguments = true,
    excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
  }
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  ScalaMetals.capabilities = require("lsp").capabilities(capabilities)
end

return M
