--------------------
-- Telescope

local builtin = require('telescope.builtin')

-- Telescope settings
require('telescope').setup {
    defaults = {
        prompt_prefix = "   ",
        selection_caret = " ❯  ",

        mappings = {
            i = {
                ["<C-j>"] = require('telescope.actions').move_selection_next,
                ["<C-k>"] = require('telescope.actions').move_selection_previous,
            },
        },
    },
}

-- Telescope key maps
vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- Find files
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})  -- Search string
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})    -- List buffers
