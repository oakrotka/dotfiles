local M = {}

--- Opinionated function to open a terminal to the right, unlisted among buffers,
--- with the right width for me to comfortably navigate the code and the CLI at the same time
function M.open_terminal_split()
  local buf = vim.api.nvim_create_buf(false, false)
  if buf == 0 then
    vim.notify('Failed to create buffer', vim.log.levels.ERROR)
    return
  end

  vim.api.nvim_open_win(buf, true, {
    split = 'right',
    -- width: TODO open terminal width to make the current code always span 100 columns
  })

  local shell = vim.fn.jobstart(vim.o.shell, {
    term = true,
    on_exit = function ()
      vim.api.nvim_buf_delete(buf, { force = true })
    end,
  })

  if shell == 0 or shell == -1 then
    vim.notify('Failed to create shell', vim.log.levels.ERROR)
    vim.api.nvim_buf_delete(0, {})
    return
  end

  vim.api.nvim_buf_set_name(buf, 'Split terminal')

  -- this buffer is unlisted, so we want to kill it when it goes offscreen (gets lost)
  vim.api.nvim_create_autocmd('BufHidden', {
    buffer = buf,
    callback = function ()
      vim.fn.jobstop(shell)
    end,
  })
end

return M
