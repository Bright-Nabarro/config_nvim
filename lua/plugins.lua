--插件配置(使用lazy)

--检测lazy并自动安装
-------------------------------------------------------------
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
	'git',
	'clone',
    	'--filter=blob:none',
    	'https://github.com/folke/lazy.nvim.git',
    	'--branch=stable', -- latest stable release
    	lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
-------------------------------------------------------------


--插件
require('lazy').setup({
    ---- 美化 ----
    -- 主题配色
    { 'catppuccin/nvim', name = 'catppuccin' },
    -- 彩虹括号
    { 'hiphish/rainbow-delimiters.nvim' },
    -- 图标
    { 'onsails/lspkind.nvim', event = { 'VimEnter' }, }, --在nvim启动时自动加载
    -- 底部状态栏
    {
      'nvim-lualine/lualine.nvim', dependencies = {
      'nvim-tree/nvim-web-devicons' }, -- 依赖图标
    },

    ---- 功能 ----
    -- 文件树
    {
      'nvim-tree/nvim-tree.lua', dependencies = {
      'nvim-tree/nvim-web-devicons', }, -- 依赖图标
      lazy = false,
    },
    -- 标签页
    -- bufferline
    -- { 'akinsho/bufferline.nvim' },
    -- barbar
    { 'romgrk/barbar.nvim', dependencies = {
      'lewis6991/gitsigns.nvim', -- git状态
      'nvim-tree/nvim-web-devicons', }, -- 依赖图标
    },

    -- 自动补全 
    -- nvim-cmp
    {
      'hrsh7th/nvim-cmp', dependencies = {
      'lspkind.nvim',
      'hrsh7th/cmp-nvim-lsp',		-- lsp auto-completion
      'hrsh7th/cmp-buffer',		-- buffer auto-completion
      'hrsh7th/cmp-path',		-- path auto-completion
      'hrsh7th/cmp-cmdline', },		-- cmdline auto-completion 
    },
    -- 补全引擎(由nvim-cmp调用)
    { 'L3MON4D3/LuaSnip', version = 'v2.*', },
    -- LSP 管理
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },
	-- 函数补全
	{ 'ray-x/lsp_signature.nvim', event = "VeryLazy",},
})

