--主题配置
-- 主题颜色
require('pgconfig.catppuccin')
vim.cmd.colorscheme 'catppuccin'
require('pgconfig.rainbow-delimiters')

-- 设置高亮方式为下划线
vim.cmd.highlight 'cursorLine gui=underline guibg=none'
