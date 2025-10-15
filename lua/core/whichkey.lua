local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
  return
end

-- Setup which-key with v3 API
whichkey.setup {
  plugins = {
    marks = false,
    registers = true,
    spelling = { enabled = false },
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = false,
      nav = false,
      z = true,
      g = false,
    },
  },
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  win = {
    border = "single",
  },
}

-- Register mappings using new v3 API
whichkey.add {
  -- Normal mode mappings
  { "<leader>q", "<cmd>qa!<cr>", desc = "Quit" },
  { "<leader>s", "<cmd>up<cr>", desc = "Save" },
  {
    "<leader><space>",
    function()
      require("utils.functions").find_commands()
    end,
    desc = "Commands",
  },

  -- Action group
  { "<leader>a", group = "Action" },
  { "<leader>ad", group = "Dial" },
  { "<leader>adf", desc = "Forward" },
  { "<leader>adb", desc = "Back" },
  { "<leader>ae", group = "Exchange" },
  {
    "<leader>ael",
    function()
      require("substitute.exchange").line()
    end,
    desc = "Line",
  },
  {
    "<leader>aec",
    function()
      require("substitute.exchange").cancel()
    end,
    desc = "Cancel",
  },
  {
    "<leader>aei",
    function()
      require("substitute.exchange").operator { motion = "i" }
    end,
    desc = "Inner",
  },
  {
    "<leader>aea",
    function()
      require("substitute.exchange").operator { motion = "a" }
    end,
    desc = "Around",
  },
  {
    "<leader>aef",
    function()
      require("substitute.exchange").operator { motion = "f" }
    end,
    desc = "FrontFind",
  },
  {
    "<leader>aeb",
    function()
      require("substitute.exchange").operator { motion = "b" }
    end,
    desc = "BackFind",
  },
  {
    "<leader>ag",
    "<cmd>lua require('utils.functions').misspellings()<cr>",
    desc = "Grammar Check",
  },
  {
    "<leader>al",
    "gu",
    desc = "LowerCase",
  },
  {
    "<leader>ao",
    "<cmd>execute 'silent! !xdg-open ' . shellescape(expand('<cfile>'), 1)<cr>",
    desc = "Open URL",
  },
  {
    "<leader>ai",
    "<cmd>lua require('nvim-treesitter.incremental_selection').init_selection()<cr>",
    desc = "IncrSelection",
  },
  {
    "<leader>as",
    "<cmd>lua require('iswap').iswap_with()<cr>",
    desc = "SwapArgs",
  },
  {
    "<leader>au",
    "gU",
    desc = "UpperCase",
  },
  { "<leader>at", "<cmd>setlocal scrolloff=0<CR>ztM<cmd>silent setlocal scrolloff=8<CR>", desc = "TopLine" },
  { "<leader>ab", "<cmd>setlocal scrolloff=0<CR>zbM<cmd>silent setlocal scrolloff=8<CR>", desc = "BotLine" },

  -- Buffer group
  { "<leader>b", group = "Buffer" },
  { "<leader>bq", "<cmd>Bdelete<cr>", desc = "Quit" },
  { "<leader>bs", "<cmd>lua require('buffer_manager.ui').toggle_quick_menu()<cr>", desc = "Select" },

  -- Comment
  {
    "<leader>/",
    function()
      require("Comment.api").toggle.linewise.current()
    end,
    desc = "Comment",
  },

  -- Code group
  { "<leader>c", group = "Code" },
  { "<leader>cb", desc = "Build" },
  { "<leader>cc", desc = "Compile" },
  { "<leader>cr", desc = "Run" },
  { "<leader>cp", desc = "Preview" },

  -- Editor group
  { "<leader>e", group = "Editor" },
  { "<leader>ef", "<cmd>lua require'utils.functions'.search_dotfiles()<cr>", desc = "Files" },
  { "<leader>eh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", desc = "Help Tags" },
  { "<leader>eo", "<cmd>lua require('utils.functions').find_options()<cr>", desc = "Options" },
  { "<leader>ep", group = "Plugin" },
  { "<leader>epi", "<cmd>Lazy install<cr>", desc = "Install" },
  { "<leader>epc", "<cmd>Lazy clean<cr>", desc = "Clean" },
  { "<leader>eps", "<cmd>Lazy<cr>", desc = "Status" },
  { "<leader>epu", "<cmd>Lazy update<cr>", desc = "Update" },
  { "<leader>epy", "<cmd>Lazy sync<cr>", desc = "Sync" },
  { "<leader>el", "<cmd>lua require('utils.functions').lang_select()<cr>", desc = "Language" },

  -- Jump group
  { "<leader>j", group = "Jump" },
  { "<leader>jb", "Lzz", desc = "Bottom Screen" },
  { "<leader>ji", "^", desc = "Init Text" },
  { "<leader>jt", "Hzz", desc = "Top Screen" },
  { "<leader>jc", "M", desc = "Center" },
  { "<leader>je", "$", desc = "End" },
  { "<leader>js", "0", desc = "Start Line" },
  { "<leader>jo", desc = "Above" },
  { "<leader>jd", desc = "Down Cursor" },

  -- Window group
  { "<leader>w", group = "Window" },
  { "<leader>wa", "<cmd>lua require('winshift').cmd_winshift()<cr>", desc = "Arrange" },
  { "<leader>wq", "<cmd>q!<cr>", desc = "Quit" },
  { "<leader>wn", group = "New" },
  { "<leader>wnh", "<cmd>above vnew<cr>", desc = "Right" },
  { "<leader>wnl", "<cmd>below vnew<cr>", desc = "Left" },
  { "<leader>wnj", "<cmd>below new<cr>", desc = "Below" },
  { "<leader>wnk", "<cmd>above new<cr>", desc = "Above" },
  { "<leader>ws", group = "Split" },
  { "<leader>wsh", "<cmd>above vsp<cr>", desc = "Right" },
  { "<leader>wsl", "<cmd>below vsp<cr>", desc = "Left" },
  { "<leader>wsj", "<cmd>below split<cr>", desc = "Below" },
  { "<leader>wsk", "<cmd>above split<cr>", desc = "Above" },
  { "<leader>wr", group = "Resize" },
  { "<leader>wrj", "<cmd>resize -5<cr>", desc = "Vertical Decrease" },
  { "<leader>wrk", "<cmd>resize +5<cr>", desc = "Vertical Increase" },
  { "<leader>wrl", "<cmd>vertical resize +5<cr>", desc = "Horizontal Increase" },
  { "<leader>wrh", "<cmd>vertical resize -5<cr>", desc = "Horizontal Decrease" },
  {
    "<leader>we",
    function()
      require("window-picker").swap()
    end,
    desc = "Exchange",
  },
  { "<leader>wm", group = "Move" },
  { "<leader>wml", "<cmd>lua require('winshift').cmd_winshift('right')<cr>", desc = "Right" },
  { "<leader>wmh", "<cmd>lua require('winshift').cmd_winshift('left')<cr>", desc = "Left" },
  { "<leader>wmj", "<cmd>lua require('winshift').cmd_winshift('down')<cr>", desc = "Down" },
  { "<leader>wmk", "<cmd>lua require('winshift').cmd_winshift('up')<cr>", desc = "Up" },
  { "<leader>wmf", group = "Far" },
  { "<leader>wmfl", "<cmd>lua require('winshift').cmd_winshift('far_right')<cr>", desc = "Right" },
  { "<leader>wmfh", "<cmd>lua require('winshift').cmd_winshift('far_left')<cr>", desc = "Left" },
  { "<leader>wmfj", "<cmd>lua require('winshift').cmd_winshift('far_down')<cr>", desc = "Down" },
  { "<leader>wmfk", "<cmd>lua require('winshift').cmd_winshift('far_up')<cr>", desc = "Up" },
  { "<leader>wme", group = "Exchange" },
  { "<leader>wmeh", "<cmd>lua require('swap-buffers').swap_buffers('h')<CR>", desc = "Left" },
  { "<leader>wmel", "<cmd>lua require('swap-buffers').swap_buffers('l')<CR>", desc = "Right" },
  { "<leader>wmej", "<cmd>lua require('swap-buffers').swap_buffers('j')<CR>", desc = "Down" },
  { "<leader>wmek", "<cmd>lua require('swap-buffers').swap_buffers('k')<CR>", desc = "Up" },
  {
    "<leader>wf",
    function()
      require("neo-zoom").neo_zoom()
    end,
    desc = "Focus",
  },
  {
    "<leader>wc",
    function()
      require("window-picker").zap()
    end,
    desc = "Close Selec",
  },
  {
    "<leader>wi",
    function()
      require("window-picker").pick()
    end,
    desc = "Instant Jump",
  },
  { "<leader>wp", "<C-W>p", desc = "Previous" },
  { "<leader>wk", "<C-w>k", desc = "Up" },
  { "<leader>wj", "<C-w>j", desc = "Down" },
  { "<leader>wl", "<C-w>l", desc = "Right" },
  { "<leader>wh", "<C-w>h", desc = "Left" },

  -- Toggle group
  { "<leader>t", group = "Toggle" },
  {
    "<leader>t/",
    function()
      require("cmdbuf").split_open(vim.o.cmdwinheight, { type = "vim/search/forward" })
    end,
    desc = "SearchWin",
  },
  {
    "<leader>t<space>",
    function()
      require("cmdbuf").split_open(vim.o.cmdwinheight, { type = "lua/cmd" })
    end,
    desc = "CmdWin",
  },
  {
    "<leader>tc",
    function()
      require("utils.functions").colorizer_toggle()
    end,
    desc = "Colorizer",
  },
  {
    "<leader>te",
    function()
      require("neo-tree").focus("", true, true)
    end,
    desc = "Explorer",
  },
  { "<leader>ts", "<cmd>setlocal spell!<CR>", desc = "SpellCheck" },
  { "<leader>tu", "<cmd>UndotreeToggle<cr><cmd>UndotreeFocus<cr>", desc = "Undotree" },
  {
    "<leader>tp",
    function()
      require("trouble").toggle()
    end,
    desc = "Panel",
  },
  {
    "<leader>tq",
    function()
      require("trouble").toggle "quickfix"
    end,
    desc = "Quickfix",
  },
  { "<leader>ty", "<cmd>lua require('neoclip').toggle()<cr>", desc = "Yank History" },

  -- Terminal group
  { "<leader>x", group = "Xterm" },
  { "<leader>xm", "<cmd>lua require'toggleterm'.toggle_command('',1)<cr>", desc = "Main" },
  { "<leader>x2", "<cmd>lua require'toggleterm'.toggle_command('',2)<cr>", desc = "Second" },

  -- LSP group
  { "<leader>l", group = "LSP" },
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Action" },
  { "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover Docs" },
  { "<leader>lr", "<cmd>lua require('renamer').rename()<CR>", desc = "Rename" },
  { "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature Help" },
  {
    "<leader>ld",
    function()
      require("trouble").toggle "workspace_diagnostics"
    end,
    desc = "Diagnostics",
  },
  { "<leader>lg", group = "GoTo" },
  {
    "<leader>lgd",
    function()
      require("telescope.builtin").lsp_definitions()
    end,
    desc = "Definition",
  },
  { "<leader>lgD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Declaration" },
  {
    "<leader>lgr",
    function()
      require("trouble").toggle "lsp_references"
    end,
    desc = "References",
  },
  {
    "<leader>lgi",
    "<cmd>lua vim.lsp.buf.implementation()<CR>",
    desc = "Implementation",
  },
  { "<leader>lp", group = "Peek" },
  {
    "<leader>lpd",
    "<cmd>lua require('goto-preview').goto_preview_definition()<cr>",
    desc = "Definition",
  },
  {
    "<leader>lpi",
    "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>",
    desc = "Implementation",
  },
  {
    "<leader>lpq",
    "<cmd>lua require('goto-preview').close_all_win()<cr>",
    desc = "Quit",
  },

  -- Git group
  { "<leader>g", group = "Git" },
  { "<leader>gh", group = "Hunks" },
  {
    "<leader>ghn",
    "<cmd>Gitsigns next_hunk<cr>",
    desc = "Next Hunk",
  },
  {
    "<leader>ghp",
    "<cmd>Gitsigns prev_hunk<cr>",
    desc = "Prev Hunk",
  },
  {
    "<leader>ghb",
    "<cmd>Gitsigns blame_line<cr>",
    desc = "Hunk Blame",
  },
  {
    "<leader>ghP",
    "<cmd>Gitsigns preview_hunk<cr>",
    desc = "Preview Hunk",
  },
  {
    "<leader>ghr",
    "<cmd>Gitsigns reset_hunk<cr>",
    desc = "Restore Hunk",
  },
  {
    "<leader>ghR",
    "<cmd>Gitsigns reset_buffer<cr>",
    desc = "Restore Buffer",
  },
  {
    "<leader>ghs",
    "<cmd>Gitsigns stage_hunk<cr>",
    desc = "Stage Hunk",
  },
  {
    "<leader>ghu",
    "<cmd>Gitsigns undo_stage_hunk<cr>",
    desc = "Unstage Hunk",
  },
  {
    "<leader>gs",
    "<cmd>lua require('telescope.builtin').git_status()<cr>",
    desc = "Status",
  },
  {
    "<leader>gb",
    "<cmd>Gitsigns toggle_current_line_blame<cr>",
    desc = "Blame Toggle",
  },
  {
    "<leader>g/",
    "<cmd>lua require('neogit').open()<cr>",
    desc = "CmdStation",
  },

  -- Peek group
  { "<leader>p", group = "Peek" },
  {
    "<leader>pm",
    "<cmd>marks<cr>",
    desc = "Marks",
  },
  {
    "<leader>pj",
    "<cmd>jumps<cr>",
    desc = "Jumps",
  },
  {
    "<leader>pc",
    "<cmd>changes<cr>",
    desc = "Changes",
  },
  {
    "<leader>pb",
    "<cmd>buffers<cr>",
    desc = "Buffers",
  },
  {
    "<leader>pr",
    "<cmd>registers<cr>",
    desc = "Registers",
  },

  -- Find group
  { "<leader>f", group = "Find" },
  {
    "<leader>f/",
    "<cmd>lua require('utils.functions').curbuf()<cr>",
    desc = "Search",
  },
  { "<leader>fg", group = "Git" },
  {
    "<leader>fgb",
    "<cmd>lua require('telescope.builtin').git_branches()<cr>",
    desc = "Branchs",
  },
  {
    "<leader>fgc",
    "<cmd>lua require('telescope.builtin').git_commits()<cr>",
    desc = "Commits",
  },
  {
    "<leader>fgC",
    "<cmd>lua require('telescope.builtin').git_bcommits()<cr>",
    desc = "Current file only commits",
  },
  {
    "<leader>fq",
    "<cmd>lua require('telescope.builtin').quickfix()<cr>",
    desc = "Quickfix",
  },
  { "<leader>fW", group = "Workspace" },
  {
    "<leader>fWd",
    "<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>",
    desc = "Diagnostics",
  },
  {
    "<leader>fWs",
    ":lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>",
    desc = "Symbols",
  },
  {
    "<leader>fl",
    "<cmd>lua require('utils.functions').local_files()<cr>",
    desc = "Local Files",
  },
  {
    "<leader>fh",
    "<cmd>lua require('telescope.builtin').man_pages()<cr>",
    desc = "Help",
  },
  {
    "<leader>ft",
    "<cmd>lua require('telescope.builtin').live_grep()<cr>",
    desc = "Text",
  },
  {
    "<leader>fw",
    "<cmd>lua require('telescope.builtin').grep_string { search = vim.fn.expand('<cword>') }<cr>",
    desc = "Word",
  },
  {
    "<leader>fb",
    "<cmd>lua require('telescope.builtin').buffers()<cr>",
    desc = "Buffer",
  },
  {
    "<leader>fr",
    "<cmd>lua require('telescope.builtin').oldfiles()<cr>",
    desc = "Recent Files",
  },
  {
    "<leader>fc",
    "<cmd>lua require('telescope').extensions.neoclip.default()<cr>",
    desc = "Clipboard",
  },
  {
    "<leader>fn",
    "<cmd>lua require'utils.functions'.search_notes()<cr>",
    desc = "Notes",
  },
  {
    "<leader>fm",
    "<cmd>lua require('telescope').extensions.macroscope.default()<cr>",
    desc = "Macros",
  },
}

-- Visual mode mappings
whichkey.add {
  mode = { "v" },
  {
    "<leader>/",
    function()
      local api = require "Comment.api"
      local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
      vim.api.nvim_feedkeys(esc, "nx", false)
      api.toggle.linewise(vim.fn.visualmode())
    end,
    desc = "Comment",
  },
  { "<leader>s", desc = "ScopeSelec" },
  { "<leader>r", ":s//g<left><left>", desc = "Replace" },
  {
    "<leader>e",
    function()
      require("substitute.exchange").visual()
    end,
    desc = "Exchange",
  },
  { "<leader>j", group = "Jump" },
  { "<leader>jo", desc = "Over" },
  { "<leader>jd", desc = "Down" },
  { "<leader>je", "$", desc = "End" },
  { "<leader>jb", "0", desc = "Begining" },
}

-- Set background color
vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = nil })
