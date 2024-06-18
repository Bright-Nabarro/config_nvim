--[[
--------------------------------------------------------------------------------------
    nvim configure
--------------------------------------------------------------------------------------
--]]

require('basic')
require('plugins')

require('pgconfig.nvim-treesitter')
-- 加载主题
require('colorscheme')

-- 加载插件
require('pgconfig.nvim-tree')
require('pgconfig.lualine')
require('pgconfig.barbar')
require('lsp.nvim-cmp')
require('lsp.lsp')
require('pgconfig.lsp_signature')
require('pgconfig.markdown-preview')

-- 加载映射
require('keymap')

--Neovide配置
if vim.g.neovide then
	require('neovide')
end
