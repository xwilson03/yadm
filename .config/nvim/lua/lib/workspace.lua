local workspaces = require("workspaces")
local resession = require("resession")
local neo_tree = require("neo-tree.command")
local alpha = require("alpha")

local function content_path(workspace_path)
    local name = workspace_path:gsub("/", "_"):gsub(":", "_")
    return vim.fn.stdpath("data") .. "/workspace/" .. name .. "_content.json"
end

local function save_content(workspace_path)
    local content = {}
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if vim.bo[bufnr].modified and vim.api.nvim_buf_is_loaded(bufnr) then
            local buf_name = vim.api.nvim_buf_get_name(bufnr)
            if buf_name ~= "" then
                local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
                content[buf_name] = lines
            end
        end
    end
    if vim.tbl_isempty(content) then return end
    vim.fn.mkdir(vim.fn.stdpath("data") .. "/workspace", "p")
    vim.fn.writefile({ vim.fn.json_encode(content) }, content_path(workspace_path))
end

local function load_content(workspace_path)
    local path = content_path(workspace_path)
    if vim.fn.filereadable(path) == 0 then return end
    local ok, content = pcall(vim.fn.json_decode, table.concat(vim.fn.readfile(path), "\n"))
    if not ok then return end
    vim.schedule(function()
        for buf_name, lines in pairs(content) do
            local bufnr = vim.fn.bufadd(buf_name)
            vim.fn.bufload(bufnr)
            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
            vim.bo[bufnr].modified = true
        end
    end)
    vim.fn.delete(path)
end

local M = {}

function M.save_session()
    local path = workspaces.path()
    if not path then return end
    vim.notify("Saving workspace session: " .. path)
    resession.save(path, { dir = "workspace", notify = false })
    save_content(path)
end

function M.load_session(path)
    vim.notify("Loading workspace session: " .. path)
    resession.load(path, { dir = "workspace", silence_errors = true, notify = false })
    vim.notify("Saving workspace session (attach): " .. path)
    resession.save(path, { dir = "workspace", notify = false })
    load_content(path)
    neo_tree.execute({ action = "focus" })
    alpha.redraw()
end

return M
