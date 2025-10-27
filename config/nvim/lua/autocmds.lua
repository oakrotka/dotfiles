local connect = vim.api.nvim_create_autocmd

-- switch back to the beam cursor after shutdown
-- - in the future, maybe figure out a way to autodetect the terminal's
--   default cursor style? not sure if it's possible though
-- - I also tried to get it to work after suspend but failed :(
connect('VimLeave', { command = 'set guicursor=a:ver1-blinkon1' })

connect('TermOpen', { command = 'startinsert' })
