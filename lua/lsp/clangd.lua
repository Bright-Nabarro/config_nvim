--lsp clangd配置
local on_attach = function(client, bufnr)
    require('keymap').maplsp(client, bufnr)
end

require('lspconfig').clangd.setup{
    on_attach = on_attach,
    cmd = {
	'clangd',
	'--header-insertion=never',	--禁止自动插入头文件
    	'--query-driver=/opt/homebrew/opt/llvm/bin/clang', --指定使用clang编译
    	'--all-scopes-completion',	--启用所有作用域代码补全
    	'--completion-style=detailed', 	--提供补全信息
    }
}

