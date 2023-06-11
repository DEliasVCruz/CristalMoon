local opt = vim.opt
-- vim.g.python3_host_prog = "/home/danielv/.pyenv/versions/py3nvim/bin/python"

-- Paths
CACHE_PATH = vim.fn.stdpath "cache"

-- Setting Different Options
vim.opt.shortmess:append "c"
vim.opt.viewoptions:append { "slash", "unix" }
vim.opt.viewoptions:remove { "cursor", "curdir" }
vim.opt.fillchars:append { eob = " " }
opt.fileencoding = "utf-8" -- The encoding written to file
opt.guicursor = "n-sm:block,i-ci-ve-c:ver25-Cursor,r-cr-o-v:hor20,n-v-c-i:blinkon10,i:blinkwait10"
opt.hidden = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true -- Converts tabs to spaces
opt.wrap = false
opt.swapfile = false
opt.backup = false -- No backup files
opt.undodir = CACHE_PATH .. "/undo" -- Set undo directory
opt.undofile = true -- Enable persistent undo
opt.smartindent = true
opt.number = true
opt.relativenumber = true
opt.sidescrolloff = 4
opt.scrolloff = 0
opt.spelllang = "en_us"
-- opt.signcolumn = "auto:1-2"
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.colorcolumn = "92"
opt.termguicolors = true -- set term gui colors most terminals support this
opt.showmode = false -- We don't need to see things like -- INSERT -- anymore
opt.showcmd = false -- We don't need to see things like -- INSERT -- anymore
opt.lazyredraw = true
opt.grepprg = "rg --vimgrep --no-heading --smart-case"
opt.grepformat = "%f:%l:%c:%m"
opt.splitbelow = true
opt.cursorline = true
opt.clipboard = "unnamedplus"
opt.laststatus = 3
opt.mouse = nil

-- Having longer update leads to noticeable delays and poor user experience
opt.updatetime = 50
opt.timeoutlen = 250

-- Folding style
-- opt.fillchars:append { vert = "┃", fold = "·" }
opt.foldmethod = "manual" -- not as cool as syntax, but faster
opt.foldlevelstart = 99 -- start unfolded
