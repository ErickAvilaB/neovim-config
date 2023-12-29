--------------------
-- LSP

local lsp_zero = require('lsp-zero')

-- Set mappings
lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)          -- Go to definition
    vim.keymap.set("n", "<Leader>j", function() vim.diagnostic.goto_next() end, opts) -- Go to next diagnostic
    vim.keymap.set("n", "<Leader>k", function() vim.diagnostic.goto_prev() end, opts) -- Go to previous diagnostic
    vim.keymap.set("n", "<leader>i", function() vim.lsp.buf.format() end)             -- Format buffer
    vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end)             -- Rename
end)

-- Auto set up language servers
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { "lua_ls" },
    handlers = {
        lsp_zero.default_setup,
    },
})

-- Auto completion
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = true }),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Remap next/prev to j/k
        ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),

        -- Remap cancel to C - c
        ['<C-c>'] = cmp.mapping.close(),
    })
})
