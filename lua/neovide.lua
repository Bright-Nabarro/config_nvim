-- noevide 配置
-- 配置字体
vim.o.guifont = 'Maple Mono SC NF:h13'
-- 背景透明透明度
vim.g.neovide_theme = 'dark'
vim.g.neovide_transparency = 0.8
-- 滚动时间（默认0.3)
vim.g.neovide_scroll_animation_length = 0.2
-- 浮动背景模糊强度
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0
-- 浮动窗口阴影
vim.g.neovide_floating_shadow = true
vim.g.neovide_floating_z_height = 10
vim.g.neovide_light_angle_degrees = 45
vim.g.neovide_light_radius = 5
--浮动窗口颜色
vim.cmd([[highlight NormalFloat guibg=#525561]])
vim.cmd([[highlight FloatBorder guibg=#171819]])

local function set_ime(args)
    if args.event:match("Enter$") then
        vim.g.neovide_input_ime = true
    else
        vim.g.neovide_input_ime = false
    end
end

local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })

vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
    group = ime_input,
    pattern = "*",
    callback = set_ime
})

vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
    group = ime_input,
    pattern = "[/\\?]",
    callback = set_ime
})
-- 当 Neovide 窗口失去焦点时，光标的轮廓宽度
vim.g.neovide_cursor_unfocused_outline_width = 0.075
--insert模式动画
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.g.neovide_cursor_vfx_mode = "ripple"
