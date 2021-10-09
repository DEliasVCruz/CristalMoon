local M = {}

M.conf = function()
  -- Define diagnostic sumbols and colors
  require "lsp.diagnos_conf"

  -- Define some handlres
  local handlers = vim.lsp.handlers
  local popup_opts = { border = "rounded", max_width = 80 }
  handlers["textDocument/hover"] = vim.lsp.with(handlers.hover, popup_opts)
  handlers["textDocument/signatureHelp"] = vim.lsp.with(handlers.signature_help, popup_opts)

  -- Tell lsp about nvim-cmp
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

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

-- Diagnostic mapping
vim.api.nvim_set_keymap("n", "<C-p>", ":lua vim.lsp.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-n>", ":lua vim.lsp.diagnostic.goto_next()<CR>", { noremap = true, silent = true })

-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
  "   (Text) ",
  "   (Method)",
  "   (Function)",
  "   (Constructor)",
  " ﴲ  (Field)",
  "[] (Variable)",
  "   (Class)",
  " ﰮ  (Interface)",
  "   (Module)",
  " 襁 (Property)",
  "   (Unit)",
  "   (Value)",
  " 練 (Enum)",
  "   (Keyword)",
  "   (Snippet)",
  "   (Color)",
  "   (File)",
  "   (Reference)",
  "   (Folder)",
  "   (EnumMember)",
  " ﲀ  (Constant)",
  " ﳤ  (Struct)",
  "   (Event)",
  "   (Operator)",
  "   (TypeParameter)",
}

local function documentHighlight(client)
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

local function documentFormatting(client)
  if client.resolved_capabilities.document_formatting then
    vim.cmd [[augroup Formatting]]
    vim.cmd [[autocmd! * <buffer>]]
    vim.cmd [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
    vim.cmd [[augroup END]]
  end
end

local lsp_config = {}

function lsp_config.common_on_attach(client)
  documentHighlight(client)
  documentFormatting(client)
end

return M
