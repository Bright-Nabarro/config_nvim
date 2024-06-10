local function table_diff(t1, t2)
    local diff = {}
    local t2_set = {}
    -- 将 t2 的值存储在集合中
    for _, v in ipairs(t2) do
        t2_set[v] = true
    end
    -- 将 t1 中不在 t2_set 中的值添加到 diff
    for _, v in ipairs(t1) do
        if not t2_set[v] then
            table.insert(diff, v)
        end
    end
    return diff
end

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local ensureServers = {
    'pylsp',	'lua_ls',	'cmake',
    'bashls',

}

local settingServers = {
    'clangd',	'lua_ls',
}

local defaultServers = table_diff(ensureServers, settingServers)

--mason 管理补全插件
require('mason').setup({
    ui = {
        icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗'
        }
    }
})

require('mason-lspconfig').setup({
    ensure_installed = ensureServers,
})

local lspconfig = require('lspconfig')
-- 包装keymap的
local on_attach = function(client, bufnr)
    require('keymap').maplsp(client, bufnr)
end

--设置默认的lsp, 使用默认keymap映射
for _, lsp in ipairs(defaultServers) do
    lspconfig[lsp].setup {
	on_attach = on_attach,
    }
end

--使用手动设置，手动设置文件在lsp/lsp_name中
for _, lsp in ipairs(settingServers) do
    require('lsp.'..lsp)
end

