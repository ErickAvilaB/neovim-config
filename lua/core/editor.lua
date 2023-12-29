-----------------------------------------------------------
-- General Neovim settings and configuration

local g = vim.g       -- Global variables
local opt = vim.opt   -- Set options (global/buffer/windows-scoped)

---------------
-- Editor

g.python3_host_prog = "/usr/bin/python3.11"    -- Python host
opt.completeopt = 'menuone,noinsert,noselect'  -- Auto complete options
opt.mouse = 'a'                       -- Enable mouse support
opt.clipboard = 'unnamedplus'         -- Copy/paste to system clipboard
vim.opt.spelllang = 'en_us'           -- Spell check language
opt.spell = true                      -- Disable spell check
opt.swapfile = false                  -- Don't use swap file
opt.showcmd = false         -- Don't show commands
opt.showmatch = true        -- Highlight matching parenthesis
opt.cursorline = true       -- Highlight current line
opt.splitright = true       -- Vertical split to the right
opt.splitbelow = true       -- Horizontal split to the bottom
opt.linebreak = true        -- Wrap on word boundary
opt.termguicolors = true    -- Enable 24-bit RGB colors

---------------
-- Line status

opt.laststatus = 3            -- Set global status line
opt.showmode = false          -- Disable mode in line
opt.ruler = false             -- Disable percent

---------------
-- Numbers

opt.number = true           -- Show line numbers
opt.relativenumber = true   -- Enable relative number
opt.numberwidth = 1         -- Small numbers

---------------
-- Indent

opt.expandtab = true        -- Use spaces instead of tabs
opt.smartindent = true      -- Auto indent new lines
opt.autoindent = true       -- Detect indent
opt.shiftwidth = 4          -- Shift 4 spaces when tab
opt.softtabstop = 4         -- Tab length in cols
opt.tabstop = 4             -- 1 tab == 4 spaces

---------------
-- Search

opt.ignorecase = true       -- Ignore case letters when search
opt.smartcase = true        -- Ignore lowercase for the whole pattern
opt.hlsearch = true         -- Show every match
opt.incsearch = true        -- Real time results

---------------
-- Memory, CPU
opt.hidden = true           -- Enable background buffers
opt.history = 100           -- Remember N lines in history
opt.lazyredraw = true       -- Faster scrolling
opt.synmaxcol = 240         -- Max column for syntax highlight
opt.updatetime = 250        -- ms to wait for trigger an event
