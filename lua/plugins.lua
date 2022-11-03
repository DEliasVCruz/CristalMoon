local present, _ = pcall(require, "core.packer")
local packer

if present then
  packer = require "packer"
else
  return false
end

local use = packer.use

return packer.startup(function()
  -- Packer can manage itself as an optional plugin
  use { "wbthomason/packer.nvim" }

  -- Colorschemes
  use {
    "eddyekofo94/gruvbox-flat.nvim",
    opt = true,
    setup = function()
      require("colors_conf").setup()
    end,
    config = function()
      require("colors_conf").config()
    end,
  }
  use {
    "EdenEast/nightfox.nvim",
    opt = true,
    config = function()
      require "colors.fox_conf"
    end,
  } -- Curly underline diagnosis, matchparen, cmp
  use {
    "kyazdani42/nvim-web-devicons",
    after = "vn-night.nvim",
    config = function()
      require "core.icons_conf"
    end,
  }
  use { -- todo: Use the apis for checking colorschemes
    "Pocco81/Catppuccino.nvim",
    opt = true,
    config = function()
      require "colors.catppuccino_conf"
    end,
  }
  use { -- todo: Use the apis for checking colorschemes
    "srcery-colors/srcery-vim",
    opt = true,
    setup = function()
      vim.g.srcery_bg_passthrough = 1
    end,
  }
  use {
    "nxvu699134/vn-night.nvim",
    event = "VimEnter",
    config = function()
      require "colors.vn_night"
      require("lightspeed").init_highlight(true)
    end,
  }

  -- Lsp config
  use {
    "williamboman/mason.nvim",
    config = function()
      require("lsp.install").config()
    end,
  }
  use { "williamboman/mason-lspconfig.nvim", module = "mason-lspconfig" }
  use {
    "neovim/nvim-lspconfig",
    module = "lspconfig",
    config = function()
      require("lsp.install").setup()
      require("lsp").conf()
    end,
  }
  use {
    "scalameta/nvim-metals",
    requires = "nvim-lua/plenary.nvim",
    module = "metals",
    config = function()
      require("lsp.scala_metals_lsp").config()
    end,
  }
  use {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      local attach = require("lsp").attach
      require("lsp.format").config(attach)
    end,
  }
  use {
    "lukas-reineke/lsp-format.nvim",
    module = "lsp-format",
    config = function()
      require("lsp-format").setup {}
    end,
  }
  --[[ use { -- TODO: Modifiy the source code plugin
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").register_lsp_virtual_lines()
    end,
  } ]]
  --[[ use { -- TODO: Needs more polish
    "j-hui/fidget.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("fidget").setup { text = { spinner = "arc" } }
    end,
  } ]]
  use {
    "mattn/emmet-vim",
    ft = { "html", "css" },
  }
  use {
    "rmagatti/goto-preview",
    module = "goto-preview",
    config = function()
      require("lsp.previewer").config()
    end,
  }
  use {
    "b0o/schemastore.nvim",
    module = "schemastore",
  }
  use {
    "abzcoding/renamer.nvim",
    branch = "develop",
    module = "renamer",
    config = function()
      require("core.various").rename_conf()
    end,
  }
  -- use {"jubnzv/virtual-types.nvim"} -- Show type annotation with CodeLens
  use {
    "https://gitlab.com/yorickpeterse/nvim-dd.git",
    after = "nvim-lspconfig",
    config = function()
      require("core.various").config "dd"
    end,
  }
  -- use{"goolord/nvim-clap-lsp"} -- nvim-lsp handlers with fancy ui
  -- use{"weilbith/nvim-code-action-menu"} -- A fancy menu for code actions with diff
  -- use{"ericpubu/lsp_codelens_extensions.nvim"} -- Adds client-side code for codelenses commands that are not available in the language servers
  -- use{"kosayoda/nvim-lightbulb"} -- Display a lightbulb next to lines with code actions
  -- use{"nvim-lua/lsp-status.nvim"} -- Utility to get diagnistic and lsp messages to use in statusline

  -- Telescope
  use { "nvim-lua/plenary.nvim", event = "BufRead" }
  use {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("core.telescope_conf").config()
      vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = nil })
    end,
  }
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    config = function()
      require("telescope").load_extension "fzf"
    end,
    run = "make",
  }
  -- use({ "nvim-telescope/telescope-smart-history.nvim" }) -- Smart history based on project
  -- use{"mrjones2014/tldr.nvim"} -- Brwose tldr from telescope (needs installed client)

  -- Version management
  use {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    setup = function()
      vim.g.undotree_SplitWidth = 35
    end,
  }
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("core.gitsigns").config()
    end,
    after = "plenary.nvim",
  }
  -- use {
  -- "sindrets/diffview.nvim",
  -- config = function()
  -- require "core.diff_view"
  -- end,
  -- }
  use {
    "TimUntersberger/neogit",
    module = "neogit",
    config = function()
      require("core.various").config "neogit"
    end,
  }
  -- use({ "bobrown101/git-blame.nvim" }) -- This could be good
  -- ues{"rhysd/git-messenger.vim"} -- View commit messages and olders

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    -- event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    -- module = "nvim-treesitter",
    config = function()
      require("core.treesitter").config()
    end,
  }
  use {
    "windwp/nvim-ts-autotag",
    ft = { "html", "css", "scss", "js" },
  }
  -- use {"SmiteshP/nvim-gps"} -- Status line component that show scope
  -- use{"RRethy/nvim-treesitter-textsubjects"} -- simple text objects
  -- use{"David-Kunz/treesitter-unit/"} -- Only deal with units (not complex)
  -- use{"Jason-M-Chan/ts-textobjects"} -- Move acoress the object tree
  -- use{"LhKipp/nvim-nu"} -- Basic editor treesiter syntax support for nushell

  -- Filetype support
  use { "flniu/er.vim", ft = { "er" } }

  -- Status Line
  use {
    -- "glepnir/galaxyline.nvim",
    "NTBBloodbath/galaxyline.nvim",
    config = function()
      require "core.galaxyline"
    end,
    after = "vn-night.nvim",
  }
  use {
    "akinsho/bufferline.nvim",
    config = function()
      require("core.bufferline").config()
    end,
    event = { "BufModifiedSet", "BufAdd" },
  }
  use {
    "famiu/bufdelete.nvim",
    module = "core.bufferline",
  }
  -- use {"GustavoKatel/sidebar.nvim"} -- Sidebar with helfpfull custom info
  -- use{"windwp/windline.nvim"} -- A status line with animations (faster than feline)
  -- use{'nanozuki/tabby.nvim'} -- A nice tab visualizer (for window layout multiplexing)

  -- Completion
  use {
    "hrsh7th/nvim-cmp",
    after = "friendly-snippets",
    config = function()
      require "core.completion.cmp_nvim"
    end,
  }
  use {
    "L3MON4D3/LuaSnip",
    wants = "friendly-snippets",
    after = "nvim-cmp",
    config = function()
      require "core.completion.snippets"
    end,
  }
  use { "rafamadriz/friendly-snippets", event = { "InsertEnter", "CmdlineEnter" } }
  use { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" }
  use { "hrsh7th/cmp-nvim-lua", after = "cmp_luasnip" }
  use { "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua" }
  use { "lukas-reineke/cmp-under-comparator", module = "cmp-under-comparator" }
  use { "lukas-reineke/cmp-rg", after = "cmp-nvim-lsp" }
  use { "tzachar/fuzzy.nvim", after = "cmp-rg" }
  use { "tzachar/cmp-fuzzy-buffer", after = "fuzzy.nvim" }
  use { "hrsh7th/cmp-path", after = "nvim-cmp" }
  use { "hrsh7th/cmp-cmdline", event = "CmdlineEnter" }

  -- Better serching
  use { "romainl/vim-cool", event = "CmdlineEnter" }
  use {
    "petertriho/nvim-scrollbar",
    -- event = "BufRead",
    config = function()
      require("core.various").config "scrollbar"
    end,
  }
  use {
    "kevinhwang91/nvim-hlslens",
    event = "CmdlineEnter",
    module = "hlslens",
    keys = { "*", "g*" },
    config = function()
      require "core.search"
    end,
  }
  -- use {"VonHeikemen/searchbox.nvim"} -- highlighting isn't working
  use {
    "haya14busa/vim-asterisk",
    module = "hlslens",
  }
  -- use { "VonHeikemen/fine-cmdline.nvim" }

  -- Interface & UI
  use {
    "folke/which-key.nvim",
    config = function()
      require "core.whichkey"
      -- Set background color
      vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = nil })
    end,
    keys = "<leader>",
  }
  -- Guide: <https://muniftanjim.dev/blog/neovim-build-ui-using-nui-nvim/>
  use { "MunifTanjim/nui.nvim", module = "nui" }
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    module = "neo-tree",
    config = function()
      require("core.neotree").config()
      vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = nil })
    end,
  }
  use {
    "akinsho/toggleterm.nvim",
    module = "toggleterm",
    config = function()
      require "core.toggleterm"
    end,
  }
  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
      require "core.blankline"
    end,
  }
  use {
    "edluffy/specs.nvim",
    module = "specs",
    config = function()
      require("core.various").beam_conf()
    end,
  }
  use {
    "folke/trouble.nvim",
    module = "trouble",
    config = function()
      require("core.trouble_conf").config()
    end,
  }
  -- use { "gabrielpoca/replacer.nvim", module = "replacer" }
  -- use({ "rcarriga/nvim-notify" }) -- Fancy notification ui (requires config)
  -- use{"lukas-reineke/headlines.nvim"} -- Pretty headlines for headers and sections
  -- use{"haringsrob/nvim_context_vt"} -- Using virtual text as context print (treesiter)
  -- use{"Pocco81/HighStr.nvim"} -- highlighting visual selections like in a normal document editor
  -- use {"luukvbaal/stabilize.nvim"} -- Don't move windows when opening splits below

  -- Symbols
  -- use {"stevearc/aerial.nvim/"} -- A simple simbols explorer bar
  -- use {"simrat39/symbols-outline.nvim"} -- A tree like view for symbols

  -- Quality of life
  use { -- TODO: configure colors of <A-e> and configure special rules
    "windwp/nvim-autopairs",
    after = { "nvim-cmp" },
    config = function()
      require("core.completion.autopairs").config()
    end,
  }
  use {
    "numToStr/Comment.nvim",
    module = "Comment",
    config = function()
      require("core.commenting").config()
    end,
  }
  use {
    "norcalli/nvim-colorizer.lua",
    ft = { "css", "scss", "js", "reactjs", "html" },
    module = "colorizer",
    -- opt = true,
    config = function()
      require("colors.preview_color").config()
    end,
  }
  use { -- Only works for booleans
    "monaqa/dial.nvim",
    module = "dial",
    config = function()
      require("core.dialer").config()
    end,
  }
  use {
    "nacro90/numb.nvim",
    event = "CmdlineEnter",
    config = function()
      require("numb").setup()
    end,
  }
  use {
    "nyngwang/NeoZoom.lua",
    module = "neo-zoom",
  }
  -- use({ "wsdjeg/vim-fetch", keys = "gF" }) -- Follow files on line and colum
  use {
    "abecodes/tabout.nvim",
    config = function()
      require("core.various").config "tabout"
    end,
    after = "nvim-cmp",
  }
  -- use {
  -- "tami5/sqlite.lua",
  -- module = "sqlite",
  -- }
  use {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    after = "nvim-cmp",
    config = function()
      require("core.various").config "better_escape"
    end,
  }
  use {
    "notomo/cmdbuf.nvim",
    module = "cmdbuf",
    config = function()
      require("core.command_buf").config()
    end,
  }
  -- use({ "danymat/neogen" }) -- Annotation generator for classes and functions
  -- use({ "nvim-telescope/telescope-cheat.nvim" }) -- Browse cheat sheets (not maintained)
  -- use{"nvim-telescope/telescope-cheat.nvim"} -- Acces cheat.sh from within nvim
  -- use{"rmagatti/auto-session"} -- Could be a replacement for vim-stay
  -- use {"lazytanuki/nvim-mapper"} -- Great way to document your keymaps (Could integrate to whichkey)
  -- use {'pianocomposer321/yabs.nvim'} -- An async build system to run your tasks form vim
  -- use {"chentau/marks.nvim"} -- A better user experience for interacting with and manipulating Vim marks (quickfix)
  -- use { "vim-scripts/RelOps" } -- Does not work but it has ideas
  -- use {"VonHeikemen/fine-cmdline.nvim"} -- A floting window based Ex: cmd line

  -- Neovim startup fixes
  use { "lewis6991/impatient.nvim" }
  use {
    "ethanholz/nvim-lastplace",
    config = function()
      require("core.various").config "nvim-lastplace"
    end,
  }

  -- Movement and text objects
  -- use { "machakann/vim-sandwich", keys = { "s" } }
  --[[ use {
    "echasnovski/mini.nvim",
    -- module = "mini.surround",
    config = function()
      require("core.various").config "mini.surround"
    end,
  } ]]
  use { "ggandor/lightspeed.nvim", event = "BufRead" }
  use {
    "gbprod/substitute.nvim",
    module = "substitute",
    config = function()
      require("core.various").config "substitute"
    end,
  }
  use {
    "mizlan/iswap.nvim",
    module = "iswap",
    config = function()
      require("core.various").config "iswap"
    end,
  }
  use { "tpope/vim-repeat", keys = "." }
  use { -- Expands vim native objects capabilities (inner '')
    "wellle/targets.vim",
    keys = { "c", "d", "y" },
    setup = function()
      vim.g.targets_jumpRanges = "rr rb rB bb bB BB ll al Al aa Aa AA"
    end,
  }
  use { "chaoren/vim-wordmotion", event = "BufRead" }
  -- use {"michaeljsmith/vim-indent-object"} -- Text object to operate on indents
  -- use {"AndrewRadev/splitjoin.vim"} -- Expand constructs like {}
  -- use{"nvim-treesitter/nvim-treesitter-textobjects"} -- Create your own text object
  -- use{ "ooSoft/vim-argwrap"} -- Arrange arguments as list and as inline (notreesiter)

  -- Window manipulation
  use {
    "ten3roberts/window-picker.nvim",
    module = "window-picker",
    config = function()
      require("core.various").config "window-picker"
    end,
  }
  use { -- Help moving windows around
    "sindrets/winshift.nvim",
    module = "winshift",
    config = function()
      require("core.various").config "winshift"
    end,
  }
  use {
    "caenrique/swap-buffers.nvim",
    module = "swap-buffers",
    config = function()
      require("core.various").config "swap-buffers"
    end,
  }
  -- use {"beauwilliams/focus.nvim"} -- Autofocus splits
  -- use {'kwkarlwang/bufjump.nvim'} -- More easilly move inside the buffer stack
  -- use {"kwkarlwang/bufresize.nvim"} -- Keep split sizing when rizing

  -- Spell checking
  -- use { "brymer-meneses/grammar-guard.nvim" } -- Spell checking lsp

  -- Markdown and Rmarkdown
  use {
    "vim-pandoc/vim-pandoc-syntax",
    ft = { "markdown.pandoc" },
  }

  -- Debugger and testing framework
  -- use { 'Dkendal/nvim-minor-mode' } -- To go to submode keymaps

  -- Note taking and todos
  -- use { 'rexagod/samwise.nvim' } -- Line wise note taking
  -- use {"GustavoKatel/todo-comments.nvim"} -- Highlight todo coments (fork)

  -- Working with macros
  -- use {'svermeulen/vim-macrobatics'} -- Good ideas for macro usage (look for lua)
  -- use {"rbong/vim-buffest"} -- Edit registers (vimbased)

  -- Others
  -- use {"dccsillag/magma-nvim"} -- Running code interactively with jupyter notebook
  -- use {'CRAG666/code_runner.nvim', branch = "new_features"} -- Code runner
  -- use {"vuki656/package-info.nvim"} -- Package managment help for npm modules
  -- use {"edluffy/hologram.nvim"} -- Terminal image viewer for (only works with kityy so far)
  -- use {"jameshiew/nvim-magic"} -- Client for OpenAI Codex (close beta)
  -- use {"spywhere/detect-language.nvim"} -- Filetype autodection power by treesiter
  -- use {"vigoux/templar.nvim"} -- Create templates
end)
