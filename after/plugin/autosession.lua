local opts = {
  log_level = 'info',
  auto_session_enable_last_session = false,
  auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
  auto_session_enabled = true,
  auto_save_enabled = nil,
  auto_restore_enabled = nil,
  auto_session_suppress_dirs = nil,
  auto_session_use_git_branch = nil,
  -- the configs below are lua only
  bypass_session_save_file_types = nil
}

require('auto-session').setup(opts)
-- require('lualine').setup{
--   options = {
--     theme = 'tokyonight',
--   },
--   sections = {lualine_c = {require('auto-session-library').current_session_name}}
-- }


-- Keymaps
vim.keymap.set('n', '<leader><C-s>', ':SaveSession<CR>') -- save session
vim.keymap.set('n', '<leader><C-r>', ':RestoreSession<CR>') -- restore session
vim.keymap.set('n', '<leader><C-o>', ':lua require("session-lens").search_session()<CR>') -- restore session

