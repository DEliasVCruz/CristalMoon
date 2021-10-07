-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/danielv/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/danielv/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/danielv/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/danielv/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/danielv/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Catppuccino.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29colorschemes.catppuccino\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/Catppuccino.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim"
  },
  LuaSnip = {
    after = { "cmp_luasnip" },
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28core.completion.luasnip\frequire\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    wants = { "friendly-snippets" }
  },
  ["better-escape.nvim"] = {
    config = { "\27LJ\2\np\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\fmapping\1\0\2\tkeys\v<esc>l\ftimeout\3»\1\1\2\0\0\ajk\nsetup\18better_escape\frequire\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/better-escape.nvim"
  },
  ["bufdelete.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/bufdelete.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\20core.bufferline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/bufferline.nvim"
  },
  ["circles.nvim"] = {
    config = { "\27LJ\2\nb\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\nicons\1\0\0\1\0\2\vfilled\bÔÑë\nempty\bÔÑå\nsetup\fcircles\frequire\0" },
    load_after = {
      ["nvim-web-devicons"] = true,
      ["vn-night.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/circles.nvim"
  },
  ["cmp-buffer"] = {
    after = { "cmp-path" },
    after_files = { "/home/danielv/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["cmp-nvim-lsp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    after = { "cmp-buffer" },
    after_files = { "/home/danielv/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      ["cmp-nvim-lua"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after = { "cmp-nvim-lsp" },
    after_files = { "/home/danielv/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {
      cmp_luasnip = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "/home/danielv/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["cmp-buffer"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/cmp-path"
  },
  cmp_luasnip = {
    after = { "cmp-nvim-lua" },
    after_files = { "/home/danielv/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {
      LuaSnip = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/cmp_luasnip"
  },
  ["commented.nvim"] = {
    config = { "\27LJ\2\n{\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\16keybindings\1\0\1\16ex_mode_cmd\1\1\0\2\6n\15<leader>ac\6v\14<leader>c\nsetup\14commented\frequire\0" },
    load_after = {
      ["which-key.nvim"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/commented.nvim"
  },
  ["dial.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\14core.dial\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/dial.nvim"
  },
  ["emmet-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/emmet-vim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19core.formatter\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/formatter.nvim"
  },
  ["friendly-snippets"] = {
    after = { "nvim-cmp" },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20core.galaxyline\frequire\0" },
    load_after = {
      ["vn-night.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\18core.gitsigns\frequire\0" },
    load_after = {
      ["plenary.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim"
  },
  ["goto-preview"] = {
    config = { "\27LJ\2\nb\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0C                            normal zt\n                        \bcmd\bvimk\1\0\4\0\5\0\n6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0003\2\4\0)\3\1\0B\0\3\1K\0\1\0\0\rdefer_fn.set nonumber norelativenumber scrolloff=0\bcmd\bvimÉ\1\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0003\3\4\0=\3\5\2B\0\2\1K\0\1\0\19post_open_hook\0\1\0\4\vheight\3\f\21default_mappings\1\nwidth\3P\ndebug\1\nsetup\17goto-preview\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/goto-preview"
  },
  ["gruvbox-flat.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\16colors_conf\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/gruvbox-flat.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\nK\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\22create_hl_autocmd\1\nsetup\bhop\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/hop.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/start/impatient.nvim"
  },
  ["iswap.nvim"] = {
    config = { "\27LJ\2\n\\\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\tgrey\fdisable\17hl_selection\fComment\nsetup\niswap\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/iswap.nvim"
  },
  ["numb.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/numb.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30core.completion.autopairs\frequire\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18core.quickfix\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/nvim-bqf"
  },
  ["nvim-cmp"] = {
    after = { "better-escape.nvim", "LuaSnip", "tabout.nvim", "nvim-autopairs" },
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29core.completion.cmp_nvim\frequire\0" },
    load_after = {
      ["friendly-snippets"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\no\0\0\3\0\6\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\30ColorizerReloadAllBuffers\bcmd\bvim\vconfig\19core.colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-hlslens"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16core.search\frequire\0" },
    keys = { { "", "*" }, { "", "g*" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/nvim-hlslens"
  },
  ["nvim-lspconfig"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-neoclip.lua"] = {
    config = { "\27LJ\2\nì\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\2B\0\2\1K\0\1\0\tkeys\6i\1\0\0\1\0\2\npaste\n<c-y>\17paste_behind\n<c-b>\1\0\1\30enable_persistant_history\1\nsetup\fneoclip\frequire\0" },
    loaded = true,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\18core.nvimtree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\20core.treesitter\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    after = { "circles.nvim" },
    load_after = {
      ["vn-night.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons"
  },
  ["nvim-window.git"] = {
    config = { "\27LJ\2\nê\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\nchars\1\0\3\fhint_hl\tBold\vborder\vsingle\14normal_hl\tTodo\1\v\0\0\6v\6k\6j\6a\6f\6l\6d\6s\6g\6h\nsetup\16nvim-window\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/nvim-window.git"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    after = { "gitsigns.nvim" },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/plenary.nvim"
  },
  ["quick-scope"] = {
    keys = { { "", "f" }, { "", "F" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/quick-scope"
  },
  ["sqlite.lua"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/sqlite.lua"
  },
  ["srcery-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/srcery-vim"
  },
  ["tabout.nvim"] = {
    config = { "\27LJ\2\nJ\0\0\4\0\4\0\n6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\1B\2\1\1K\0\1\0\nsetup\vtabout\frequire\npcall\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/tabout.nvim"
  },
  tabular = {
    after_files = { "/home/danielv/.local/share/nvim/site/pack/packer/opt/tabular/after/plugin/TabularMaps.vim" },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/tabular"
  },
  ["targets.vim"] = {
    keys = { { "", "c" }, { "", "d" }, { "", "y" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/targets.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-fzf-native.nvim" },
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\19core.telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20core.toggleterm\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/toggleterm.nvim"
  },
  ["tokyonight-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/tokyonight-vim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/undotree"
  },
  ["vim-SpellCheck"] = {
    load_after = {
      ["vim-ingo-library"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/vim-SpellCheck"
  },
  ["vim-asterisk"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/vim-asterisk"
  },
  ["vim-cool"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/vim-cool"
  },
  ["vim-exchange"] = {
    keys = { { "", "cx" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/vim-exchange"
  },
  ["vim-ingo-library"] = {
    after = { "vim-SpellCheck" },
    commands = { "SpellCheck" },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/vim-ingo-library"
  },
  ["vim-matchup"] = {
    after_files = { "/home/danielv/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    loaded = false,
    needs_bufread = true,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/vim-matchup"
  },
  ["vim-maximizer"] = {
    commands = { "MaximizerToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/vim-maximizer"
  },
  ["vim-pandoc-syntax"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/vim-pandoc-syntax"
  },
  ["vim-repeat"] = {
    keys = { { "", "." } },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/vim-repeat"
  },
  ["vim-sandwich"] = {
    keys = { { "", "s" } },
    loaded = false,
    needs_bufread = true,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/vim-sandwich"
  },
  ["vim-stay"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/vim-stay"
  },
  ["vn-night.nvim"] = {
    after = { "galaxyline.nvim", "circles.nvim", "nvim-web-devicons" },
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26colorschemes.vn_night\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/vn-night.nvim"
  },
  ["which-key.nvim"] = {
    after = { "commented.nvim" },
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18core.whichkey\frequire\0" },
    keys = { { "", "<leader>" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/which-key.nvim"
  },
  ["winshift.nvim"] = {
    config = { "\27LJ\2\n∂\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\23moving_win_options\1\0\4\16colorcolumn\5\17cursorcolumn\1\15cursorline\1\twrap\1\1\0\2\21focused_hl_group\vVisual\25highlight_moving_win\2\nsetup\rwinshift\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/danielv/.local/share/nvim/site/pack/packer/opt/winshift.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^core%.bufferline"] = "bufdelete.nvim",
  ["^dial"] = "dial.nvim",
  ["^goto%-preview"] = "goto-preview",
  ["^hlslens"] = "vim-asterisk",
  ["^hop"] = "hop.nvim",
  ["^iswap"] = "iswap.nvim",
  ["^lsp%.emmet_lsp"] = "emmet-vim",
  ["^lspconfig"] = "nvim-lspconfig",
  ["^numb"] = "numb.nvim",
  ["^nvim%-treesitter"] = "vim-matchup",
  ["^nvim%-window"] = "nvim-window.git",
  ["^packer"] = "packer.nvim",
  ["^sqlite"] = "sqlite.lua",
  ["^telescope"] = "telescope.nvim",
  ["^toggleterm"] = "toggleterm.nvim",
  ["^utils%.quickfix"] = "nvim-bqf",
  ["^winshift"] = "winshift.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18core.nvimtree\frequire\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
-- Setup for: srcery-vim
time([[Setup for srcery-vim]], true)
try_loadstring("\27LJ\2\n7\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\26srcery_bg_passthrough\6g\bvim\0", "setup", "srcery-vim")
time([[Setup for srcery-vim]], false)
-- Setup for: vim-SpellCheck
time([[Setup for vim-SpellCheck]], true)
try_loadstring("\27LJ\2\nj\0\0\2\0\5\0\t6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0K\0\1\0\5\25SpellCheck_OnNospell'SpellCheck_DefineAuxiliaryCommands\6g\bvim\0", "setup", "vim-SpellCheck")
time([[Setup for vim-SpellCheck]], false)
-- Setup for: quick-scope
time([[Setup for quick-scope]], true)
try_loadstring("\27LJ\2\n_\0\0\2\0\5\0\t6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1ñ\0=\1\4\0K\0\1\0\17qs_max_chars\1\5\0\0\6f\6F\6t\6T\25qs_highlight_on_keys\6g\bvim\0", "setup", "quick-scope")
time([[Setup for quick-scope]], false)
-- Setup for: vim-matchup
time([[Setup for vim-matchup]], true)
try_loadstring("\27LJ\2\nN\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\1\vmethod\npopup!matchup_matchparen_offscreen\6g\bvim\0", "setup", "vim-matchup")
time([[Setup for vim-matchup]], false)
-- Setup for: targets.vim
time([[Setup for targets.vim]], true)
vim.g.targets_jumpRanges = "rr rb rB bb bB BB ll al Al aa Aa AA"
time([[Setup for targets.vim]], false)
-- Setup for: nvim-lspconfig
time([[Setup for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rlsp.conf\frequire\0", "setup", "nvim-lspconfig")
time([[Setup for nvim-lspconfig]], false)
-- Setup for: tokyonight-vim
time([[Setup for tokyonight-vim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28colorschemes.tokyo_conf\frequire\0", "setup", "tokyonight-vim")
time([[Setup for tokyonight-vim]], false)
-- Setup for: gruvbox-flat.nvim
time([[Setup for gruvbox-flat.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16colors_conf\frequire\0", "setup", "gruvbox-flat.nvim")
time([[Setup for gruvbox-flat.nvim]], false)
-- Config for: nvim-neoclip.lua
time([[Config for nvim-neoclip.lua]], true)
try_loadstring("\27LJ\2\nì\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\2B\0\2\1K\0\1\0\tkeys\6i\1\0\0\1\0\2\npaste\n<c-y>\17paste_behind\n<c-b>\1\0\1\30enable_persistant_history\1\nsetup\fneoclip\frequire\0", "config", "nvim-neoclip.lua")
time([[Config for nvim-neoclip.lua]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MaximizerToggle lua require("packer.load")({'vim-maximizer'}, { cmd = "MaximizerToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SpellCheck lua require("packer.load")({'vim-ingo-library'}, { cmd = "SpellCheck", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <leader> <cmd>lua require("packer.load")({'which-key.nvim'}, { keys = "<lt>leader>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> s <cmd>lua require("packer.load")({'vim-sandwich'}, { keys = "s", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> d <cmd>lua require("packer.load")({'targets.vim'}, { keys = "d", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> F <cmd>lua require("packer.load")({'quick-scope'}, { keys = "F", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g* <cmd>lua require("packer.load")({'nvim-hlslens'}, { keys = "g*", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> * <cmd>lua require("packer.load")({'nvim-hlslens'}, { keys = "*", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> cx <cmd>lua require("packer.load")({'vim-exchange'}, { keys = "cx", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> . <cmd>lua require("packer.load")({'vim-repeat'}, { keys = ".", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> f <cmd>lua require("packer.load")({'quick-scope'}, { keys = "f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> c <cmd>lua require("packer.load")({'targets.vim'}, { keys = "c", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> y <cmd>lua require("packer.load")({'targets.vim'}, { keys = "y", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType css ++once lua require("packer.load")({'nvim-colorizer.lua', 'nvim-ts-autotag'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType js ++once lua require("packer.load")({'nvim-colorizer.lua', 'nvim-ts-autotag'}, { ft = "js" }, _G.packer_plugins)]]
vim.cmd [[au FileType rmd ++once lua require("packer.load")({'tabular'}, { ft = "rmd" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-colorizer.lua', 'nvim-ts-autotag'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType mom ++once lua require("packer.load")({'tabular'}, { ft = "mom" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-pandoc-syntax', 'tabular'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'tabular'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType groff ++once lua require("packer.load")({'tabular'}, { ft = "groff" }, _G.packer_plugins)]]
vim.cmd [[au FileType latex ++once lua require("packer.load")({'tabular'}, { ft = "latex" }, _G.packer_plugins)]]
vim.cmd [[au FileType reactjs ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "reactjs" }, _G.packer_plugins)]]
vim.cmd [[au FileType scss ++once lua require("packer.load")({'nvim-colorizer.lua', 'nvim-ts-autotag'}, { ft = "scss" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufModifiedSet * ++once lua require("packer.load")({'bufferline.nvim'}, { event = "BufModifiedSet *" }, _G.packer_plugins)]]
vim.cmd [[au BufAdd * ++once lua require("packer.load")({'bufferline.nvim'}, { event = "BufAdd *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'vim-stay', 'nvim-treesitter', 'plenary.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'friendly-snippets', 'better-escape.nvim'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'vn-night.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufWritePre * ++once lua require("packer.load")({'formatter.nvim'}, { event = "BufWritePre *" }, _G.packer_plugins)]]
vim.cmd [[au CmdlineEnter * ++once lua require("packer.load")({'vim-cool', 'nvim-hlslens'}, { event = "CmdlineEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
