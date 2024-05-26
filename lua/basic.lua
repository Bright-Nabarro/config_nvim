--基本配置

--相对行号
vim.wo.number = true
vim.wo.relativenumber = true
--高亮光标所在行
vim.wo.cursorline = true
--缩进
vim.o.cindent = true
vim.o.cinoptions = 'go,L0,:0'
--Tab
vim.o.shiftwidth = 4		--tab插入宽度为4
vim.o.tabstop = 4			--tab距离为4
--取消折行
vim.o.wrap = false
--启用终端颜色
vim.opt.termguicolors = true

--剪贴版，wsl加载win32yank.exe
local in_wsl = os.getenv('WSL_DISTRO_NAME') ~= nil	--检测当前环境是否是wsl
if in_wsl then
    vim.g.clipboard = {
        name = 'win32yank',
        copy = { ['+'] = { 'win32yank.exe', '-i' }, ['*'] = { 'win32yank.exe', '-i' } },
        paste = { ['+'] = { 'win32yank.exe', '-o' }, ['*'] = { 'win32yank.exe', '-o' } },
        cache_enabled = true
    }
end

