local M = {}

function M.add_below()
  if vim.g.Vm and vim.g.Vm.buffer ~= 0 and vim.b.VM_Selection then
    local regions = vim.b.VM_Selection.Regions
    if regions and #regions > 0 then
      local last = regions[#regions]
      local line = last.l
      local col = last.dir == 0 and last.a or last.b
      vim.api.nvim_win_set_cursor(0, { line, col - 1 })
    end
  end
  vim.cmd('call vm#commands#add_cursor_down(0, ' .. vim.v.count1 .. ')')
end

function M.add_above()
  if vim.g.Vm and vim.g.Vm.buffer ~= 0 and vim.b.VM_Selection then
    local regions = vim.b.VM_Selection.Regions
    if regions and #regions > 0 then
      local first = regions[1]
      local line = first.l
      local col = first.dir == 0 and first.a or first.b
      vim.api.nvim_win_set_cursor(0, { line, col - 1 })
    end
  end
  vim.cmd('call vm#commands#add_cursor_up(0, ' .. vim.v.count1 .. ')')
end

return M
