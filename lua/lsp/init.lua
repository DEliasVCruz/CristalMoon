local M = {}

M.conf = function()
  -- Define diagnostic sumbols and colors
  require "lsp.diagnos_conf"

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

M.attach = function(_, bufnr)
  -- Setup lsp attach actions
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Diagnostic Mappings.
  local opts = { noremap = true, silent = true }
  buf_set_keymap("n", "<C-p>", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "<C-n>", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
end

return M
