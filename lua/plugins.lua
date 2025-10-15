-- Plugin specifications for lazy.nvim
return {
  -- Colorschemes
  {
    "nxvu699134/vn-night.nvim",
    lazy = false,
    priority = 1000, -- Load colorscheme first
    config = function()
      require "colors.vn_night"
      require("lightspeed").init_highlight(true)
    end,
  },
  {
    "nvim-tree/nvim-web-devicons", -- Moved from kyazdani42
    dependencies = "nxvu699134/vn-night.nvim",
    config = function()
      require "core.icons_conf"
    end,
  },

  -- LSP config
  {
    "williamboman/mason.nvim",
    config = function()
      require("lsp.install").config()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
  },
  -- Java support - must be loaded BEFORE nvim-lspconfig
  {
    "nvim-java/nvim-java",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    ft = { "java" },
    config = function()
      -- Step 1: Setup nvim-java first (per documentation)
      -- -- Set JAVA_HOME to Java 17 for running jdtls (the LSP server)
      -- -- This ensures jdtls runs on a stable Java version
      -- local java_17_home = "/home/danielv/.local/share/mise/installs/java/17.0.2"
      -- vim.env.JAVA_HOME = java_17_home

      -- -- Prepend Java 17 to PATH so jdtls uses it
      -- local java_17_bin = java_17_home .. "/bin"
      -- if not vim.env.PATH:match(java_17_bin) then
      --   vim.env.PATH = java_17_bin .. ":" .. vim.env.PATH
      -- end
      require("java").setup {
        jdk = {
          auto_install = false,
          version = "25.0.0",
        },
        java_test = {
          enable = true,
          version = "0.43.1",
        },
        jdtls = {
          version = "v1.46.1",
        },
        spring_boot_tools = {
          enable = true,
          version = "1.59.0",
        },
        java_debug_adapter = {
          enable = false,
        },
        root_markers = {
          "settings.gradle",
          "settings.gradle.kts",
          "pom.xml",
          "build.gradle",
          "mvnw",
          "gradlew",
          "build.xml",
          ".git",
          "mise.toml",
        },
      }

      -- Step 2: Setup jdtls with Java 25 settings (per nvim-java docs)
      require("lspconfig").jdtls.setup {
        settings = {
          java = {
            configuration = {
              runtimes = {
                {
                  name = "JavaSE-17",
                  path = "/home/danielv/.local/share/mise/installs/java/17.0.2",
                  default = false,
                },
                {
                  name = "JavaSE-25",
                  path = "/home/danielv/.local/share/mise/installs/java/25.0.0",
                  default = true,
                },
              },
            },
            compile = {
              nullAnalysis = {
                mode = "automatic",
              },
            },
            eclipse = {
              downloadSources = true,
            },
            maven = {
              downloadSources = true,
            },
            implementationsCodeLens = {
              enabled = true,
            },
            referencesCodeLens = {
              enabled = true,
            },
            format = {
              enabled = true,
            },
          },
        },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    config = function()
      require("lsp.install").setup()
      require("lsp").conf()
    end,
  },
  {
    "scalameta/nvim-metals",
    dependencies = "nvim-lua/plenary.nvim",
    lazy = true,
    config = function()
      require("lsp.scala_metals_lsp").config()
    end,
  },
  {
    "nvimtools/none-ls.nvim", -- Maintained fork of null-ls
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "lua", "python", "go", "javascript", "typescript", "sh", "bash", "zsh" }, -- Load on these filetypes
    config = function()
      -- none-ls uses "null-ls" as the internal module name
      local null_ls = require "null-ls"
      local b = null_ls.builtins

      -- Get attach function from lsp module
      local attach = require("lsp").attach

      -- Build sources list (only include available tools)
      local sources = {}

      -- Lua formatting (stylua)
      if vim.fn.executable "stylua" == 1 then
        table.insert(sources, b.formatting.stylua)
      end

      -- Python
      if vim.fn.executable "black" == 1 then
        table.insert(sources, b.formatting.black)
      end
      if vim.fn.executable "isort" == 1 then
        table.insert(sources, b.formatting.isort)
      end

      -- Golang
      if vim.fn.executable "gofmt" == 1 then
        table.insert(sources, b.formatting.gofmt)
      end

      -- Shell
      if vim.fn.executable "shfmt" == 1 then
        table.insert(sources, b.formatting.shfmt.with { filetypes = { "sh", "zsh", "bash" } })
      end

      -- JS/TS
      if vim.fn.executable "prettierd" == 1 then
        table.insert(
          sources,
          b.formatting.prettierd.with {
            filetypes = {
              "html",
              "json",
              "scss",
              "css",
              "javascript",
              "typescript",
              "javascriptreact",
              "vue",
            },
          }
        )
      end

      null_ls.setup {
        sources = sources,
        on_attach = attach,
      }
    end,
  },
  {
    "lukas-reineke/lsp-format.nvim",
    lazy = true,
    config = function()
      require("lsp-format").setup {}
    end,
  },
  {
    "rmagatti/goto-preview",
    lazy = true,
    config = function()
      require("lsp.previewer").config()
    end,
  },
  {
    "b0o/schemastore.nvim",
    lazy = true,
  },
  {
    "abzcoding/renamer.nvim",
    branch = "develop",
    lazy = true,
    config = function()
      require("core.various").rename_conf()
    end,
  },
  {
    "yorickpeterse/nvim-dd",
    dependencies = "neovim/nvim-lspconfig",
    config = function()
      require("core.various").config "dd"
    end,
  },

  -- DAP (Debug Adapter Protocol)
  {
    "mfussenegger/nvim-dap",
    lazy = true,
  },

  -- Telescope
  { "nvim-lua/plenary.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("core.telescope_conf").config()
      vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = nil })
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    config = function()
      require("telescope").load_extension "fzf"
    end,
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },

  -- Version management
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    init = function()
      vim.g.undotree_SplitWidth = 35
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("core.gitsigns").config()
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      require("core.treesitter").config()
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "css", "scss", "js" },
  },

  -- Filetype support
  { "flniu/er.vim", ft = { "er" } },

  -- Status Line
  {
    "b0o/incline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require "core.incline"
    end,
  },

  -- lazy
  -- {
  --   "sontungexpt/witch-line",
  --   dependencies = {
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   lazy = false, -- Almost component is lazy load by default. So you can set lazy to false
  --   opts = {},
  --   config = function()
  --     require("witch-line").setup {}
  --   end,
  -- },

  {
    "MagicDuck/grug-far.nvim",
    -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
    -- additional lazy config to defer loading is not really needed...
    config = function()
      -- optional setup call to override plugin options
      -- alternatively you can set options with vim.g.grug_far = { ... }
      require("grug-far").setup {
        -- options, see Configuration section below
        -- there are no required options atm
      }
    end,
  },

  {
    "chrisgrieser/nvim-rip-substitute",
    cmd = "RipSubstitute",
    opts = {},
    keys = {
      {
        "<leader>fs",
        function()
          require("rip-substitute").sub()
        end,
        mode = { "n", "x" },
        desc = " rip substitute",
      },
    },
  },

  {
    "j-morano/buffer_manager.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    lazy = true,
    config = function()
      require("buffer_manager").setup {
        highlight = "Normal:BufferManagerBorder",
        win_extra_options = {
          winhighlight = "Normal:BufferManagerNormal",
          relativenumber = true,
        },
      }
    end,
  },

  { "famiu/bufdelete.nvim" },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = "rafamadriz/friendly-snippets",
    config = function()
      require "core.completion.cmp_nvim"
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require "core.completion.snippets"
    end,
  },
  {
    "rafamadriz/friendly-snippets",
    event = { "InsertEnter", "CmdlineEnter" },
  },
  {
    "saadparwaiz1/cmp_luasnip",
    dependencies = "L3MON4D3/LuaSnip",
  },
  {
    "hrsh7th/cmp-nvim-lua",
    dependencies = "saadparwaiz1/cmp_luasnip",
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    dependencies = "hrsh7th/cmp-nvim-lua",
  },
  {
    "lukas-reineke/cmp-under-comparator",
    lazy = true,
  },
  {
    "lukas-reineke/cmp-rg",
    dependencies = "hrsh7th/cmp-nvim-lsp",
  },
  {
    "tzachar/fuzzy.nvim",
    dependencies = "lukas-reineke/cmp-rg",
  },
  {
    "tzachar/cmp-fuzzy-buffer",
    dependencies = "tzachar/fuzzy.nvim",
  },
  {
    "hrsh7th/cmp-path",
    dependencies = "hrsh7th/nvim-cmp",
  },
  {
    "hrsh7th/cmp-cmdline",
    event = "CmdlineEnter",
  },

  -- Better searching
  {
    "romainl/vim-cool",
    event = "CmdlineEnter",
  },
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("core.various").config "scrollbar"
    end,
  },
  {
    "haya14busa/vim-asterisk",
    keys = { "*", "#", "g*", "g#" },
  },
  {
    "kevinhwang91/nvim-hlslens",
    dependencies = "haya14busa/vim-asterisk",
    event = "CmdlineEnter",
    keys = { "*", "g*" },
    config = function()
      require "core.search"
    end,
  },

  -- Interface & UI
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require "core.whichkey"
      -- Set background color
      vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = nil })
    end,
  },
  {
    "MunifTanjim/nui.nvim",
    lazy = true,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    lazy = true,
    config = function()
      require("core.neotree").config()
      vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#222338" })
      vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { bg = "#202135" })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    main = "ibl",
    config = function()
      require "core.blankline"
    end,
  },
  {
    "folke/trouble.nvim",
    lazy = true,
    config = function()
      require("core.trouble_conf").config()
    end,
  },

  -- Quality of life
  {
    "windwp/nvim-autopairs",
    dependencies = { "hrsh7th/nvim-cmp" },
    config = function()
      require("core.completion.autopairs").config()
    end,
  },
  {
    "numToStr/Comment.nvim",
    lazy = true,
    config = function()
      require("core.commenting").config()
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    ft = { "css", "scss", "js", "reactjs", "html" },
    config = function()
      require("colors.preview_color").config()
    end,
  },
  {
    "monaqa/dial.nvim",
    lazy = true,
    config = function()
      require("core.dialer").config()
    end,
  },
  {
    "nacro90/numb.nvim",
    event = "CmdlineEnter",
    config = function()
      require("numb").setup()
    end,
  },
  {
    "nyngwang/NeoZoom.lua",
    lazy = true,
  },
  {
    "abecodes/tabout.nvim",
    dependencies = "hrsh7th/nvim-cmp",
    config = function()
      require("core.various").config "tabout"
    end,
  },

  -- Neovim startup fixes
  -- Note: impatient.nvim is no longer needed in Neovim 0.9+, module caching is built-in
  {
    "ethanholz/nvim-lastplace",
    config = function()
      require("core.various").config "nvim-lastplace"
    end,
  },

  -- Movement and text objects
  {
    "ggandor/lightspeed.nvim",
    event = "BufRead",
  },
  {
    "gbprod/substitute.nvim",
    lazy = true,
    config = function()
      require("core.various").config "substitute"
    end,
  },
  {
    "mizlan/iswap.nvim",
    lazy = true,
    config = function()
      require("core.various").config "iswap"
    end,
  },
  {
    "tpope/vim-repeat",
    keys = ".",
  },
  {
    "wellle/targets.vim",
    keys = { "c", "d", "y" },
    init = function()
      vim.g.targets_jumpRanges = "rr rb rB bb bB BB ll al Al aa Aa AA"
    end,
  },

  -- Window manipulation
  {
    "ten3roberts/window-picker.nvim",
    lazy = true,
    config = function()
      require("core.various").config "window-picker"
    end,
  },
  {
    "sindrets/winshift.nvim",
    lazy = true,
    config = function()
      require("core.various").config "winshift"
    end,
  },
  {
    "caenrique/swap-buffers.nvim",
    lazy = true,
    config = function()
      require("core.various").config "swap-buffers"
    end,
  },

  -- Markdown and Rmarkdown
  {
    "vim-pandoc/vim-pandoc-syntax",
    ft = { "markdown.pandoc" },
  },
}
