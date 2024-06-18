local pluginKeys = require('keymap')

return function()
	    -- 禁用默认键映射
		vim.g.nvimgdb_disable_start_keymaps = 1

        -- 自定义键映射
        pluginKeys.nvim_gdb()
end
