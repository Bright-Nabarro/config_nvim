--lsp lua配置
local on_attach = function(client, bufnr)
    require('keymap').maplsp(client, bufnr)
end

require('lspconfig').lua_ls.setup{
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },  -- 将 'vim' 添加到已知全局变量列表
            },
        },
    },
    on_attach = on_attach,
}

