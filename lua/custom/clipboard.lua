local is_ssh = vim.env.SSH_TTY or vim.env.SSH_CONNECTION or vim.env.SSH_CLIENT

if not is_ssh then
    return
end

local osc52 = require("vim.ui.clipboard.osc52")

local function paste()
    return {vim.fn.getreg('"', 1, true), vim.fn.getregtype('"')}
end

vim.g.clipboard = {
    name = "OSC 52",
    copy = {
        ["+"] = osc52.copy("+"),
        ["*"] = osc52.copy("*")
    },
    paste = {
        ["+"] = paste,
        ["*"] = paste
    }
}
