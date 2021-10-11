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
  use { "wbthomason/packer.nvim", module = "packer" }

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
    "ghifarit53/tokyonight-vim",
    opt = true,
    setup = function()
      require "colors.tokyo_conf"
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
    end,
  }

  -- Lsp config
  use {
    "williamboman/nvim-lsp-installer",
    event = "BufRead",
    config = function()
      require("lsp.install").config()
      local attach = require("lsp").attach
      require("lsp.install").setup_lsp(attach)
    end,
  }
  use {
    "neovim/nvim-lspconfig",
    module = "lspconfig",
    setup = function()
      require("lsp.conf").setup()
    end,
    config = function()
      require("lsp").conf()
    end,
  }
  use {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("lsp.format").config()
    end,
  }
  use {
    "mattn/emmet-vim",
    module = "lsp.emmet_lsp",
  }
  use {
    "rmagatti/goto-preview",
    module = "goto-preview",
    config = function()
      require("goto-preview").setup {
        width = 80, -- Width of the floating window
        height = 12, -- Height of the floating window
        default_mappings = false, -- Bind default mappings
        debug = false, -- Print debug information
        opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = function()
          vim.cmd "set nonumber norelativenumber scrolloff=0"
          vim.defer_fn(function()
            vim.cmd [[
                            normal zt
                        ]]
          end, 1)
        end,
      }
    end,
  }
  -- use{"goolord/nvim-clap-lsp"} -- nvim-lsp handlers with fancy ui
  -- use{"weilbith/nvim-code-action-menu"} -- A fancy menu for code actions with diff
  -- use{"ericpubu/lsp_codelens_extensions.nvim"} -- Adds client-side code for codelenses commands that are not available in the language servers

  -- Telescope
  use { "nvim-lua/plenary.nvim", event = "BufRead" }
  use {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("core.telescope_conf").config()
    end,
    module = "telescope",
  }
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    config = function()
      require("telescope").load_extension "fzf"
    end,
    after = "telescope.nvim",
    run = "make",
  }
  -- use({ "nvim-telescope/telescope-smart-history.nvim" }) -- Smart history based on project

  -- Version management
  use {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
  }
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("core.gitsigns").config()
    end,
    after = "plenary.nvim",
  }
  -- use({ "bobrown101/git-blame.nvim" }) -- This could be good
  -- use{"rhysd/committia.vim"} -- Easier way to wirte commit messages

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    config = function()
      require("core.treesitter").config()
    end,
  }
  use {
    "windwp/nvim-ts-autotag",
    ft = { "html", "css", "scss", "js" },
  }
  -- use{"RRethy/nvim-treesitter-textsubjects"} -- simple text objects
  -- use{"David-Kunz/treesitter-unit/"} -- Only deal with units (not complex)
  -- use{"Jason-M-Chan/ts-textobjects"} -- Move acoress the object tree
  -- use{"LhKipp/nvim-nu"} -- Basic editor treesiter syntax support for nushell

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
  -- use{"windwp/windline.nvim"} -- A status line with animations
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
  use { "rafamadriz/friendly-snippets", event = "InsertEnter" }
  use { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" }
  use { "hrsh7th/cmp-nvim-lua", after = "cmp_luasnip" }
  use {
    "hrsh7th/cmp-nvim-lsp",
    module = "cmp_nvim_lsp",
    after = "nvim-lspconfig",
  }
  use { "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" }
  use { "hrsh7th/cmp-path", after = "cmp-buffer" }
  -- How to configure coq https://alpha2phi.medium.com/new-neovim-completion-plugins-you-should-try-b5e1a3661623
  -- use({
  -- "ms-jpq/coq_nvim",
  -- branch = "coq",
  -- event = "VimEnter",
  -- config = "vim.cmd[[COQnow]]",
  -- })
  -- use({ "ms-jpq/coq.artifacts", branch = "artifacts" })
  -- Help on setting up coq with lsp <https://teddit.net/r/neovim/comments/plj9mx>

  -- Better quickfix
  use {
    "kevinhwang91/nvim-bqf",
    module = "utils.quickfix",
    config = function()
      require "core.quickfix"
    end,
  }
  use {
    "https://gitlab.com/yorickpeterse/nvim-pqf.git",
    config = function()
      require("pqf").setup {
        signs = {
          error = "",
          warning = "",
          info = "כֿ",
          hint = "",
        },
      }
    end,
  }

  -- Better serching
  use { "romainl/vim-cool", event = "CmdlineEnter" }
  use { -- TODO: make backgroudn transparent
    "kevinhwang91/nvim-hlslens",
    event = "CmdlineEnter",
    keys = { "*", "g*" },
    config = function()
      require "core.search"
    end,
  }
  use {
    "haya14busa/vim-asterisk",
    module = "hlslens",
  }

  -- Interface & UI
  use {
    "folke/which-key.nvim",
    config = function()
      require "core.whichkey"
    end,
    keys = "<leader>",
  }
  use {
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    setup = function()
      require("core.nvimtree").setup()
    end,
    config = function()
      require("core.nvimtree").config()
    end,
  }
  use {
    "akinsho/toggleterm.nvim",
    module = "toggleterm",
    config = function()
      require "core.toggleterm"
    end,
  }
  -- use({ "ms-jpq/chadtree", cmd = "CHADopen", branch = "chad", run = "python3 -m chadtree deps" })
  -- use({ "rcarriga/nvim-notify" }) -- Fancy notification ui WIP
  -- use{"lukas-reineke/headlines.nvim"} -- Pretty headlines for headers and sections
  -- use{"MunifTanjim/nui.nvim"} -- component library to create your own ui
  -- Guide: <https://muniftanjim.dev/blog/neovim-build-ui-using-nui-nvim/>
  -- use{"haringsrob/nvim_context_vt"} -- Using virtual text as context print (treesiter)
  -- use{"Pocco81/HighStr.nvim"} -- highlighting visual selections like in a normal document editor

  -- Quality of life
  use { -- TODO: configure colors of <A-e> and configure special rules
    "windwp/nvim-autopairs",
    after = { "nvim-cmp" },
    config = function()
      require "core.completion.autopairs"
    end,
  }
  use { -- TODO: could be lazy load individually wiht <plug> look dial
    "winston0410/commented.nvim",
    after = { "which-key.nvim" },
    config = function()
      require("commented").setup {
        keybindings = { n = "<leader>ac", v = "<leader>c" },
        ex_mode_cmd = false,
      }
    end,
  }
  use {
    "norcalli/nvim-colorizer.lua",
    ft = { "css", "scss", "js", "reactjs", "html" },
    config = function()
      require("colors.preview_color").config()
      vim.cmd "ColorizerReloadAllBuffers"
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
    "szw/vim-maximizer",
    cmd = "MaximizerToggle",
  }
  -- use({ "wsdjeg/vim-fetch", keys = "gF" }) -- Follow files on line and colum
  use { "zhimsel/vim-stay", event = "BufRead" }
  use {
    "abecodes/tabout.nvim",
    config = function()
      local status_ok, tab = pcall(require, "tabout")
      if not status_ok then
        return
      end
      tab.setup()
    end,
    after = "nvim-cmp",
  }
  use { -- TODO: Pull request to define your own "spec_per_type" highlight group
    "AckslD/nvim-neoclip.lua",
    -- event = "TextYankPost",
    config = function()
      require("neoclip").setup {
        enable_persistant_history = false,
        keys = {
          i = {
            paste = "<c-y>",
            paste_behind = "<c-b>",
          },
        },
      }
    end,
  }
  use {
    "tami5/sqlite.lua",
    module = "sqlite",
  }
  use {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    after = "nvim-cmp",
    config = function()
      require("better_escape").setup {
        mapping = { "jk" },
        timeout = 200,
        keys = "<esc>l",
      }
    end,
  }
  -- use({ "danymat/neogen" }) -- Annotation generator for classes and functions
  -- use({ "nvim-telescope/telescope-cheat.nvim" }) -- Browse cheat sheets (not maintained)
  -- use{"nvim-telescope/telescope-cheat.nvim"} -- Acces cheat.sh from within nvim
  -- use{"rmagatti/auto-session"} -- Could be a replacement for vim-stay
  -- use {"lazytanuki/nvim-mapper"} -- Great way to document your keymaps (Could integrate to whichkey)

  -- Neovim startup fixes
  use { "antoinemadec/FixCursorHold.nvim" }
  use { "lewis6991/impatient.nvim" }
  use { "nathom/filetype.nvim" }

  -- Movement and text objects
  use { "machakann/vim-sandwich", keys = { "s" } }
  use { "tommcdo/vim-exchange", keys = "cx" }
  use {
    "mizlan/iswap.nvim",
    module = "iswap",
    config = function()
      require("iswap").setup {
        grey = "disable",
        hl_selection = "Comment",
      }
    end,
  }
  use { "tpope/vim-repeat", keys = "." }
  use { -- Extends the capabilities of %
    "andymass/vim-matchup",
    module = "nvim-treesitter",
    setup = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  }
  use { -- TODO: could be repalced with hop.nvim or ligthspeed.nvim
    "unblevable/quick-scope",
    keys = { "f", "F" },
    setup = function()
      vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
      vim.g.qs_max_chars = 150
    end,
  }
  use { -- Hints to move anywhere in the file TODO: Figure oout the API
    "phaazon/hop.nvim",
    -- "IndianBoy42/hop.nvim", -- treesitter extras
    module = "hop",
    config = function()
      require("hop").setup { create_hl_autocmd = false }
    end,
  }
  use { -- Expands vim native objects capabilities (inner '')
    "wellle/targets.vim",
    keys = { "c", "d", "y" },
    setup = [[vim.g.targets_jumpRanges = "rr rb rB bb bB BB ll al Al aa Aa AA"]],
  }
  -- use {"michaeljsmith/vim-indent-object"} -- Text object to operate on indents
  -- use {"AndrewRadev/splitjoin.vim"} -- Expand constructs like {}
  -- use{"nvim-treesitter/nvim-treesitter-textobjects"} -- Create your own text object
  -- use{ "ooSoft/vim-argwrap"} -- Arrange arguments as list and as inline (notreesiter)

  -- Window movement and arrangement
  use {
    "https://gitlab.com/yorickpeterse/nvim-window.git",
    module = "nvim-window",
    config = function()
      require("nvim-window").setup {
        chars = { "v", "k", "j", "a", "f", "l", "d", "s", "g", "h" },
        normal_hl = "Todo",
        hint_hl = "Bold",
        border = "single",
      }
    end,
  }
  use { -- Help moving windows around
    "sindrets/winshift.nvim",
    module = "winshift",
    config = function()
      require("winshift").setup {
        highlight_moving_win = true, -- Highlight the window being moved
        focused_hl_group = "Visual", -- The highlight group used for the moving window
        moving_win_options = {
          wrap = false,
          cursorline = false,
          cursorcolumn = false,
          colorcolumn = "",
        },
      }
    end,
  }
  -- use {"beauwilliams/focus.nvim"} -- Autofocus splits
  -- use {'kwkarlwang/bufjump.nvim'} -- More easilly move inside the buffer stack
  -- use {"kwkarlwang/bufresize.nvim"} -- Keep split sizing when rizing

  -- Spell checking
  use { "inkarkat/vim-ingo-library", cmd = "SpellCheck" }
  use {
    "inkarkat/vim-SpellCheck",
    after = "vim-ingo-library",
    setup = function()
      vim.g.SpellCheck_DefineAuxiliaryCommands = 0
      vim.g.SpellCheck_OnNospell = ""
    end,
  }
  -- Spell checking lsp "https://teddit.net/r/neovim/comments/pf2pk5"

  -- Markdown and Rmarkdown
  use {
    "godlygeek/tabular",
    ft = { "markdown", "rmd", "tex", "latex", "mom", "groff" },
  }
  use {
    "vim-pandoc/vim-pandoc-syntax",
    ft = { "markdown" },
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
