-- Variables for *
vim.g["asterisk#keeppos"] = 1

-- Keymaps
vim.keymap.set(
  "n",
  "n",
  "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>zzzv",
  { noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "N",
  "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>zzzv",
  { noremap = true, silent = true }
)
vim.keymap.set(
  "",
  "*",
  "<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>",
  { noremap = false, silent = true }
)
vim.keymap.set(
  "",
  "g*",
  "<Plug>(asterisk-gz*)<Cmd>lua require('hlslens').start()<CR>",
  { noremap = false, silent = true }
)

require("hlslens").setup {
  override_lens = function(render, plist, nearest, idx, r_idx)
    local sfw = vim.v.searchforward == 1
    local indicator, text, chunks
    local abs_r_idx = math.abs(r_idx)
    if abs_r_idx > 1 then
      indicator = ("%d%s"):format(abs_r_idx, sfw ~= (r_idx > 1) and "▲" or "▼")
    elseif abs_r_idx == 1 then
      indicator = sfw ~= (r_idx == 1) and "▲" or "▼"
    else
      indicator = ""
    end

    local lnum, col = unpack(plist[idx])
    if nearest then
      local cnt = #plist
      if indicator ~= "" then
        text = ("[%s %d/%d]"):format(indicator, idx, cnt)
      else
        text = ("[%d/%d]"):format(idx, cnt)
      end
      chunks = { { " ", "Ignore" }, { text, "HlSearchLensNear" } }
    else
      text = ("[%s %d]"):format(indicator, idx)
      chunks = { { " ", "Ignore" }, { text, "HlSearchLens" } }
    end
    render.set_virt(0, lnum - 1, col - 1, chunks, nearest)
  end,
}
