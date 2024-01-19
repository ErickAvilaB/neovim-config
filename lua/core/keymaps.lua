--------------------
-- Key maps

---------------
-- General

-- Set the map leader
vim.g.mapleader = " "

-- Function to create a map
local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Disable arrow keys
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")

---------------
-- Editor

vim.keymap.set("n", "<leader><leader>", function() vim.cmd("so") end)
map("n", "<Leader>w", ":w<CR>")     -- Save
map("n", "<Leader>W", ":wq<CR>")    -- Save and quit
map("n", "<Leader>q", ":q<CR>")     -- Quit
map("n", "<Leader>Q", ":qa!<CR>")   -- Force quit
map("n", "<Leader>+", ":vertical resize +2<CR>:resize +2<CR>")    -- Make bigger the window
map("n", "<Leader>-", ":vertical resize -2<CR>:resize -2<CR>")    -- Make smaller the window
map("n", "<Leader>s", ":/")         -- Search
map("n", "<Leader>S", ":nohl<CR>")  -- Clear search
map("n", "<Leader>a", "ggVG")       -- Select all
map("n", "<S-j>", "15jzz")          -- Go up
map("n", "<S-k>", "15kzz")          -- Go down
map("v", "J", ":m '>+1<CR>gv=gv")   -- Move line down
map("v", "K", ":m '<-2<CR>gv=gv")   -- Move line up
map("n", "n", "nzz")                -- Center search
map("n", "N", "Nzz")                -- Center search

-- Move around splits using Ctrl + {h,j,k,l}
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

---------------
-- Terminal

function open_terminal()
    -- Go most right buffer
    vim.cmd("wincmd l")
    vim.cmd("wincmd l")
    vim.cmd("wincmd l")
    -- Go most bottom buffer
    vim.cmd("wincmd j")
    vim.cmd("wincmd j")
    vim.cmd("wincmd j")
    -- Get the buffer number of the current buffer
    local bufnr = vim.api.nvim_get_current_buf()
    -- Get the buffer type of the current buffer
    local buftype = vim.api.nvim_buf_get_option(bufnr, "buftype")

    -- If the current buffer is a terminal, close it
    if buftype == "terminal" then
        vim.api.nvim_buf_delete(bufnr, { force = true })
    else
        -- Open a new terminal
        vim.cmd('below split term://zsh')

        -- Turn off line numbers
        vim.cmd("set nonumber")
        vim.cmd("set norelativenumber")

        -- Close terminal on Ctrl + t
        map("t", "<C-t>", "<C-\\><C-n>:q!<CR>")
        -- Change terminal mode to normal mode on Ctrl + h
        map("t", "<C-h>", "<C-\\><C-n>")

        -- Switch to terminal mode
        vim.cmd("startinsert")
    end
end

map("n", "<Leader>t", ":lua open_terminal()<CR>")        -- Open terminal below
