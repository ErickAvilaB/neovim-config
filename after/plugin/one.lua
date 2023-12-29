--------------------
-- One Dark theme

require('onedark').setup {
    -- Main options
    style = 'deep',      -- Style of theme
    transparent = true,  -- Show/hide background

    -- Lua line options
    lualine = {
        transparent = true, -- Lualine center bar transparency
    }
}
require('onedark').load()
