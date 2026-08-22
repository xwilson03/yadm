local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local workspaces = require("workspaces")

local M = {}

function M.setup()

    local landing_buttons = {
        dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
        dashboard.button("w", "  Open workspace", ":Telescope workspaces<CR>"),
        dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    local workspace_buttons = {
        dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
        dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
        dashboard.button("w", "  Switch workspace", ":Telescope workspaces<CR>"),
        dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    local landing_header = { "  Welcome to Neovim", "" }

    local workspace_header = function()
        return { "  Project: " .. workspaces.name(), "  " .. vim.fn.getcwd(), "" }
    end

    dashboard.section.header.val = function()
        return workspaces.name() and workspace_header() or landing_header
    end

    dashboard.section.buttons.val = function()
        return workspaces.name() and workspace_buttons or landing_buttons
    end

    dashboard.section.footer.val = "alpha-nvim"

    alpha.setup(dashboard.config)
end

function M.show_on_empty(args)
    local buf = args.buf
    vim.schedule(function()
        if vim.api.nvim_buf_is_valid(buf)
            and vim.api.nvim_buf_get_name(buf) == ""
            and vim.bo[buf].buflisted
            and vim.bo[buf].buftype == ""
        then
            if #vim.fn.getbufinfo({ buflisted = true }) == 1 then
                require("alpha").start(false)
                vim.api.nvim_buf_delete(buf, { force = true })
            end
        end
    end)
end

return M
