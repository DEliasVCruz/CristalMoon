local status_ok, term = pcall(require, "toggleterm")
if not status_ok then
  return
end

term.setup {
  size = 14,
  open_mapping = [[<C-x>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_terminals = false,
  -- shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = false,
  direction = "horizontal",
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    border = "single",
    width = 20,
    height = 30,
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
}

-- Insert leave mapping
vim.keymap.set("t", "<C-f>", "<C-\\><C-n>", { noremap = true })
