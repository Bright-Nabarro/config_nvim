--按键映射

--opt允许递归操作，opf不允许
local opt = {noremap=true, silent=true}
local opf = {noremap=false, silent=true}
--vim原始的map
local map = vim.api.nvim_set_keymap
local set = vim.keymap.set
local del = vim.keymap.del
--设置<leader>键
vim.g.mapleader = ','

--基础配置------------------------------------------------------------
-- Esc映射
map('i', 'jj', '<Esc>', opt)
-- 换页(切换缓冲区)
-- 由barbar中的换页指令取代
-- map('n', '<C-h>', ':bp!<CR>', opt)
-- map('n', '<C-l>', ':bn!<CR>', opt)
-- 切屏(wsl中<C-w>容易误触关闭窗口)
map('n', '<C-i>', '<C-w>', opf)
--取消搜索高亮
map('n', '<space><space>', ':noh<CR>', opf)

--插件配置------------------------------------------------------------
--快捷指令映射
map('n', '<C-h>', '<Cmd>BufferPrevious<CR>', opf)
map('n', '<C-l>', '<Cmd>BufferNext<CR>', opf)
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opf)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opf)
map('n', '<A-BS>', '<Cmd>BufferClose<CR>', opf)
-- 将窗口固定在右侧
vim.api.nvim_create_user_command('P', 'BufferPin', {})
-- markdown实时预览
vim.api.nvim_create_user_command('MP', 'MarkdownPreview', {})
vim.api.nvim_create_user_command('MSP', 'MarkdownPreviewStop', {})

--api映射
local pluginKeys = {}

--nvim-tree
map('n', '<C-p>', ':NvimTreeToggle<CR>', opf)
pluginKeys.nvim_tree = function(bufnr)
    local api = require('nvim-tree.api')
    local function opts(desc)
	return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    api.config.mappings.default_on_attach(bufnr) 	--启用默认配置
    del('n', '<Tab>', { buffer = bufnr })			--取消预览文件(Tab 和 <C-i>表示字符一样)
    set('n', '<C-]>', api.tree.change_root_to_node, opts('CD')) --将下一级目录作为根目录
    set('n', 'P', api.node.open.preview, opts('Preview'))
    -- 设置O为仅打开文件不移动光标
    local function open_and_return()
	api.node.open.edit()
	vim.cmd('wincmd h')
    end
    set('n', 'O', open_and_return, opts('Open and return'))
end

--nvim-cmp自动补全
pluginKeys.cmp = function(cmp)
    return {
	-- 上一个
    	['<C-k>'] = cmp.mapping.select_prev_item(),
    	-- 下一个
    	['<C-j>'] = cmp.mapping.select_next_item(),
    	['<Tab>'] = cmp.mapping.select_next_item(),
    	-- 出现补全
    	['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    	-- 取消
    	['<A-;>'] = cmp.mapping({
	    i = cmp.mapping.abort(),
	    c = cmp.mapping.close(),
	}),
    }
end

pluginKeys.maplsp = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    --转到声明
    set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    --转到定义
    set('n', 'gd', vim.lsp.buf.definition, bufopts)
    --签名显示
    set('n', 'gh', vim.lsp.buf.hover, bufopts)
    --转到实现
    set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    --
    set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    --重命名
    set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    -- 转到引用
    set('n', 'gr', vim.lsp.buf.references, bufopts)
    -- 打开诊断窗口
    set('n', '<leader>a', vim.diagnostic.open_float, opt)
end

return pluginKeys
