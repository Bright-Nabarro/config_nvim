--[[
--------------------------------------------------------------------------------------
    nvim/
    |-- init.lua 总配置控制
    |-- lua/
	|-- colorscheme.lua
	|-- basic.lua	基本设置
	|-- keymap.lua	按键映射
	|-- plugins.lua	插件管理(使用lazy.nvim)
	|-- pgconfig/	插件配置文件
	|-- lsp/	所有代码补全相关配置

--------------------------------------------------------------------------------------
--]]

require('basic')
require('plugins')
-- 加载映射
require('keymap')
-- 加载主题
require('colorscheme')

-- 加载插件
require('pgconfig.nvim-tree')
require('pgconfig.lualine')
require('pgconfig.barbar')
require('lsp.nvim-cmp')
require('lsp.lsp')
require('pgconfig.lsp_signature')

