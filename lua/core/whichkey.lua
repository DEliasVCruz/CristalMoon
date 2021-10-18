local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
  return
end

whichkey.setup {
  plugins = {
    marks = false, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 10, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = false, -- adds help for operators like d, y, ...
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = false, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = false, -- bindings for prefixed with g
    },
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "shadow", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
  },
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
}

local noreopts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local nmappings = {
  ["q"] = { "<cmd>qa!<cr>", "Quit" },
  ["s"] = { "<cmd>up<cr>", "Save" },
  ["/"] = { "<cmd>lua require('utils.functions').curbuf()<cr>", "Search" },
  ["<space>"] = { "<cmd>silent! lua require('utils.functions').find_commands()<cr>", "Commands" },
  -- ["r"] = { "<cmd>checktime<cr>", "Reload" },
  -- d = {
  -- name = "+Debug",
  -- },
  a = {
    name = "+Action",
    c = { "Comment" },
    -- c = { "<cmd>lua require('commented').toggle_comment('n')<cr>", "Comment" },
    d = { "<cmd>lua require'dial'.cmd.increment_normal(1)<cr>b", "Dial" },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    l = { "gu", "LowerCase" },
    o = { "<cmd>execute 'silent! !xdg-open ' . shellescape(expand('<cfile>'), 1)<cr>", "Open URL" },
    p = { '"+p', "Paste Clipboard" },
    s = { "<cmd>lua require('nvim-treesitter.incremental_selection').init_selection()<cr>", "SelectNode" },
    e = { "<cmd>lua require('iswap').iswap_with()<cr>", "ExchArgs" },
    u = { "gU", "UpperCase" },
    w = { "<cmd>MatchupWhereAmI??<cr>", "WhereAmI" },
    y = { '"+y', "Yank Clipboard" },
    t = { "<cmd>setlocal scrolloff=0<CR>ztM<cmd>silent setlocal scrolloff=8<CR>", "TopLine" },
    b = { "<cmd>setlocal scrolloff=0<CR>zbM<cmd>silent setlocal scrolloff=8<CR>", "TopLine" },
    -- i = { -- Maby we don't need indentention acctions
    -- name = "+Indent",
    -- l = { ">", "Formawrd" },
    -- h = { "<", "Backwards" },
    -- },
  },
  b = {
    name = "+Buffer",
    d = { "<cmd>BufferLinePickClose<cr>", "Discard" },
    j = { "<cmd>BufferLineCyclePrev<cr>", "Cycle Previous" },
    k = { "<cmd>BufferLineCycleNext<cr>", "Cycle Next" },
    p = { "<C-^>", "Previous" },
    q = { "<cmd>Bdelete<cr>", "Quit" },
    s = { "<cmd>BufferLinePick<cr>", "Select" },
    m = {
      name = "+Move",
      l = { "<cmd>BufferLineMoveNext<cr>", "Right" },
      h = { "<cmd>BufferLineMovePrev<cr>", "Left" },
    },
    c = {
      name = "+Close All",
      l = { "<cmd>BufferLineCloseRight<cr>", "Right" },
      h = { "<cmd>BufferLineCloseLeft<cr>", "Left" },
    },
  },
  c = {
    name = "+Code",
    b = { "Build" },
    c = { "Compile" },
    r = { "Run" },
    p = { "Preview" },
  },
  e = {
    name = "+Editor",
    f = {
      "<cmd>lua require'utils.functions'.search_dotfiles()<cr>",
      "Files",
    },
    h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Help Tags" },
    o = { "<cmd>lua require('utils.functions').find_options()<cr>", "Options" },
    p = {
      name = "+Plugin",
      i = { "<cmd>lua require 'plugins' require('packer').install()<cr>", "Install" },
      c = { "<cmd>lua require 'plugins' require('packer').compile()<cr>", "Compile" },
      s = { "<cmd>lua require 'plugins' require('packer').status()<cr>", "Status" },
      u = { "<cmd>lua require 'plugins' require('packer').update()<cr>", "Update" },
    },
    l = { "<cmd>lua require('utils.functions').lang_select()<cr>", "Language" },
  },
  j = {
    name = "+Jump",
    l = { "<cmd>setlocal scrolloff=0<CR>Lzz<cmd>silent setlocal scrolloff=8<CR>", "Low End" },
    i = { "^", "Init Line" },
    a = { "<cmd>setlocal scrolloff=0<CR>Hzz<cmd>silent setlocal scrolloff=8<CR>", "On top" },
    c = { "M", "Center" },
    e = { "$", "End" },
    b = { "0", "Begining" },
    j = {
      "<cmd>lua require('hop').hint_lines({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>",
      "Line Down",
    },
    k = {
      "<cmd>lua require('hop').hint_lines({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>",
      "Line Up",
    },
    o = {
      "<cmd>lua require('hop').hint_words({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>",
      "Above",
    },
    d = {
      "<cmd>lua require('hop').hint_words({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>",
      "Down Cursor",
    },
    -- s = {"", "Sidebacks"}
    -- f = {"", "Forward"}
  },
  w = {
    name = "+Window",
    a = { "<cmd>lua require('winshift').cmd_winshift()<cr>", "Arrange" },
    q = { "<cmd>q!<cr>", "Quit" },
    n = {
      name = "+New",
      h = { "<cmd>above vnew<cr>", "Right" },
      l = { "<cmd>below vnew<cr>", "Left" },
      j = { "<cmd>below new<cr>", "Below" },
      k = { "<cmd>above new<cr>", "Above" },
    },
    s = {
      name = "+Split",
      h = { "<cmd>above vsp<cr>", "Right" },
      l = { "<cmd>below vsp<cr>", "Left" },
      j = { "<cmd>below split<cr>", "Below" },
      k = { "<cmd>above split<cr>", "Above" },
    },
    r = {
      name = "+Resize",
      j = { "<cmd>resize -5<cr>", "Vertical Decrease" },
      k = { "<cmd>resize +5<cr>", "Vertical Increase" },
      l = { "<cmd>vertical resize +5<cr>", "Horizontal Increase" },
      h = { "<cmd>vertical resize -5<cr>", "Horizontal Decrease" },
    },
    m = {
      name = "+Move",
      l = { "<cmd>lua require('winshift').cmd_winshift('right')<cr>", "Right" },
      h = { "<cmd>lua require('winshift').cmd_winshift('left')<cr>", "Left" },
      j = { "<cmd>lua require('winshift').cmd_winshift('down')<cr>", "Down" },
      k = { "<cmd><lua require('winshift').cmd_winshift('up')cr>", "Up" },
      f = {
        name = "+Far",
        l = { "<cmd>lua require('winshift').cmd_winshift('far_right')<cr>", "Right" },
        h = { "<cmd>lua require('winshift').cmd_winshift('far_left')<cr>", "Left" },
        j = { "<cmd>lua require('winshift').cmd_winshift('far_down')<cr>", "Down" },
        k = { "<cmd>lua require('winshift').cmd_winshift('far_up')<cr>", "Up" },
      },
    },
    e = { "<C-w>x", "Exchange" },
    f = { "<cmd>MaximizerToggle<cr>", "Focus" },
    i = { "<cmd>lua require('nvim-window').pick()<cr>", "Instant Jump" },
    p = { "<C-W>p", "Previous" },
    k = { "<C-w>k", "Up" },
    j = { "<C-w>j", "Down" },
    l = { "<C-w>l", "Right" },
    h = { "<C-w>h", "Left" },
  },
  t = {
    name = "+Toggle",
    -- c = { "<cmd>ColorizerToggle<cr>", "Colorizer" },
    e = { "<cmd>NvimTreeToggle<cr>", "Explorer" }, -- Possibe "File Explorer"
    -- e = { "<cmd>CHADopen<cr>", "Explorer" }, -- Possibe "File Explorer"
    u = { "<cmd>UndotreeToggle<cr><cmd>UndotreeFocus<cr>", "Undotree" },
    q = { "<cmd>lua require 'utils.quickfix'.quick_fix_toggle()<cr>", "Quickfix" },
    s = { "<cmd>setlocal spell!<CR>", "SpellCheck" },
    y = { "<cmd>lua require('neoclip').toggle()<cr>", "Yank History" },
    -- e or f = {
    -- name = "+Environment or FrameWork",
    -- t = { "", "Testing" },
    -- d = { "", "Debuging" },
    -- l = {
    -- name = "+Language",
    -- r = { "", "Rust" },
    -- },
    -- },
  },
  x = {
    name = "+Xterm",
    m = { "<cmd>lua require'toggleterm'.toggle_command('',1)<cr>", "Main" },
    ["2"] = { "<cmd>lua require'toggleterm'.toggle_command('',2)<cr>", "Second" },
  },
  l = {
    name = "+LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
    h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover Docs" },
    r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
    g = {
      name = "+GoTo",
      d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
      D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
      r = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
      i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
    },
    p = {
      name = "+Peek",
      d = { "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", "Definition" },
      i = { "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>", "Implementation" },
      q = { "<cmd>lua require('goto-preview').close_all_win()<cr>", "Quit" },
    },
  },
  -- r = {
  -- name = "+Refactor",
  -- },
  g = {
    name = "+Git",
    h = {
      name = "+Hunks",
      n = { "<cmd>Gitsigns next_hunk<cr>", "Next Hunk" },
      p = { "<cmd>Gitsigns prev_hunk<cr>", "Prev Hunk" },
      b = { "<cmd>Gitsigns blame_line<cr>", "Hunk Blame" },
      P = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },
      r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
      R = { "<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer" },
      s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
      u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Unstage Hunk" },
    },
    o = { "<cmd>lua require('telescope.builtin').git_status()<cr>", "Open changed file" },
    b = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Blame Toggle" },
    ["/"] = { "<cmd>lua require('neogit').open({kind = 'split'})<cr>", "CmdStation" },
    -- d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff Prev. HEAD" }, -- Not working
    -- s = { "Status" },
    -- f = { "Fetch" },
    -- r = {
    -- 	name = "+Rebase",
    -- 	o = { "Rebase Origin" },
    -- 	u = { "Rebase Upstream" },
    -- },
    -- l = { "Right Diff" },
    -- j = { "Left Diff" },
  },
  p = {
    name = "+Peek",
    m = { "<cmd>marks<cr>", "Marks" },
    j = { "<cmd>jumps<cr>", "Jumps" },
    c = { "<cmd>changes<cr>", "Changes" },
    b = { "<cmd>buffers<cr>", "Buffers" },
    r = { "<cmd>registers<cr>", "Registers" },
  },
  f = {
    name = "+Find",
    g = {
      name = "+Git",
      b = { "<cmd>lua require('telescope.builtin').git_branches()<cr>", "Branchs" },
      c = { "<cmd>lua require('telescope.builtin').git_commits()<cr>", "Commits" },
      C = { "<cmd>lua require('telescope.builtin').git_bcommits()<cr>", "Current file only commits" },
    },
    q = { "<cmd>lua require('telescope.builtin').quickfix()<cr>", "Quickfix" },
    s = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", "Symbols" },
    W = {
      name = "+Workspace",
      d = {
        "<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>",
        "Diagnostics",
      },
      s = {
        ":lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>",
        "Symbols",
      },
    },
    l = { "<cmd>lua require('utils.functions').local_files()<cr>", "Local Files" },
    m = { "<cmd>lua require('telescope.builtin').man_pages()<cr>", "ManPages" },
    t = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Text" },
    w = {
      "<cmd>lua require('telescope.builtin').grep_string { search = vim.fn.expand('<cword>') }<cr>",
      "Word",
    },
    b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffer" },
    r = { "<cmd>lua require('telescope.builtin').oldfiles()<cr>", "Recent Files" },
    c = { "<cmd>lua require('telescope').extensions.neoclip.default()<cr>", "Clipboard" },
    n = {
      "<cmd>lua require'utils.functions'.search_notes()<cr>",
      "Notes",
    },
  },
  -- o = {
  -- name = "+Org",
  -- }
}

local reopts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = false, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local rmappings = {
  ["ag"] = { "z=", "Grammar Check" },
}

local veopts = {
  mode = "v", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  noremap = false, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local vmappings = {
  ["p"] = { '"_dP', "Paste" },
  ["f"] = { "<cmd>lua vim.lsp.buf.range_formatting()<cr>", "Format" },
  -- ["i"] = { "IncreSelec" },
  -- ["d"] = { "DecreSelec" },
  ["s"] = { "ScopeSelec" },
  ["c"] = { "Comment" },
  ["r"] = { ":s//g<left><left>", "Replace" },
  -- ["c"] = { "<cmd>lua require('commented').toggle_comment('v')<cr>", "Comment" },
  ["e"] = { "$", "End" },
  ["b"] = { "0", "Begining" },
  ["y"] = { '"+y', "Yank Clipboard" },
  ["j"] = {
    "<cmd>lua require('hop').hint_lines({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>",
    "Extend Down",
  },
  ["k"] = {
    "<cmd>lua require('hop').hint_lines({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>",
    "Extend Up",
  },
}

whichkey.register(nmappings, noreopts)
whichkey.register(rmappings, reopts)
whichkey.register(vmappings, veopts)
