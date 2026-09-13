return {
    "Kohei-Wada/yadm-git.nvim",
    lazy = false,
    opts = {},
    init = function()
        local uv = vim.uv or vim.loop
        local os_environ = uv.os_environ
        uv.os_environ = function()

            local git_dir = os.getenv("GIT_DIR")
            local work_tree = os.getenv("GIT_WORK_TREE")

            local env = os_environ()
            if work_tree then table.insert(env, "GIT_WORK_TREE=" .. work_tree) end
            if git_dir then table.insert(env, "GIT_DIR=" .. git_dir) end
            return env
        end
    end,
}
