--------------------
-- Autocmds

local augroup = vim.api.nvim_create_augroup   -- Create/get auto command group
local autocmd = vim.api.nvim_create_autocmd   -- Create auto command

-- Don't auto commenting new lines
autocmd('BufEnter', {
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o'
})

-- Remove white space on save
autocmd('BufWritePre', {
  pattern = '',
  command = ":%s/\\s\\+$//e"
})
