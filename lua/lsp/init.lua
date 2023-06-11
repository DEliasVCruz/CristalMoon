local M = {}

require "lsp.setup"

M.conf = function()
  -- Define diagnostic sumbols and colors
  require("lsp.diagnos").config()

  -- Define some handlres
  local handlers = vim.lsp.handlers
  local popup_opts = { border = "rounded", max_width = 80 }
  handlers["textDocument/hover"] = vim.lsp.with(handlers.hover, popup_opts)
  handlers["textDocument/signatureHelp"] = vim.lsp.with(handlers.signature_help, popup_opts)

  -- suppress error messages from lang servers
  vim.notify = function(msg, log_level, _opts)
    if msg:match "exit code" then
      return
    end
    if log_level == vim.log.levels.ERROR then
      vim.api.nvim_err_writeln(msg)
    else
      vim.api.nvim_echo({ { msg } }, true, {})
    end
  end
end

M.capabilities = function(capabilities)
  capabilities.textDocument.completion.completionItem.documentationFormat = {
    "markdown",
    "markdown.pandoc",
    "plaintext",
  }
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.preselectSupport = true
  capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
  capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
  capabilities.textDocument.completion.completionItem.deprecatedSupport = true
  capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
  capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }
  return capabilities
end

M.get_typescript_server_path = function(root_dir)
  local util = require "lspconfig.util"

  local global_ts = "/home/danielv/.local/share/nvm/versions/node/v18.11.0/lib/node_modules/typescript/lib"
  local found_ts = ""
  local function check_dir(path)
    found_ts = util.path.join(path, "node_modules", "typescript", "lib")
    if util.path.exists(found_ts) then
      return path
    end
  end
  if util.search_ancestors(root_dir, check_dir) then
    return found_ts
  else
    return global_ts
  end
end

M.attach = function(client, bufnr)
  -- Setup lsp attach actions
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- Setup lsp attach
  require("lsp-format").on_attach(client)

  -- Diagnostic Mappings.
  local opts = { noremap = true, silent = true }
  buf_set_keymap("n", "<C-p>", "<cmd>lua vim.diagnostic.goto_prev({popup_opts = { border = 'single' }})<CR>", opts)
  buf_set_keymap("n", "<C-n>", "<cmd>lua vim.diagnostic.goto_next({popup_opts = { border = 'single' }})<CR>", opts)
end

return M
