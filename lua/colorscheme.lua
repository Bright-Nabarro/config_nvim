--主题配置
-- 主题颜色
require('pgconfig.catppuccin')
require('pgconfig.rainbow-delimiters')
vim.cmd.colorscheme 'catppuccin'

-- 设置高亮方式为下划线
vim.cmd.highlight 'cursorLine gui=underline guibg=none'
