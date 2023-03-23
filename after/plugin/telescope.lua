-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  print('Telescope not loaded properly')
  return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  print('Telescope.actions not loaded properly')
  return
end

-- import telescope builtin safely
local builtin_setup, builtin = pcall(require, "telescope.builtin")
if not builtin_setup then
  print('Telescope.builtin not loaded properly')
  return
end

-- configure telescope
telescope.setup({
  -- configure custom mappings
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
        ["<C-b>d"] = actions.delete_buffer -- delete buffer
      },
    },
  },
})

-- local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- find files within current working directory, respects .gitignore
vim.keymap.set('n', '<leader>fs', function() -- find string in current working directory as you type
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- add the session lens extension for switching sessions
telescope.load_extension("session-lens")

telescope.load_extension("fzf")

telescope.load_extension('neoclip')
