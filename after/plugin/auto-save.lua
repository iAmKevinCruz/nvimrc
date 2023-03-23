-- require("auto-save").setup {
--   enabled = false, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
--   execution_message = {
--     message = function() -- message to print on save
--       return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
--     end,
--     dim = 0.18, -- dim the color of `message`
--     cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
--   },
--   -- trigger_events = {"InsertLeave", "TextChanged"}, -- vim events that trigger auto-save. See :h events
--   -- function that determines whether to save the current buffer or not
--   -- return true: if buffer is ok to be saved
--   -- return false: if it's not ok to be saved
--   -- condition = function(buf)
--   --   local fn = vim.fn

--   --   local isMarkdown = function(filename)
--   --     local extension = string.match(filename, "%.([^.]+)$")
--   --     return extension == "markdown" or extension == "md"
--   --   end

--   --   if
--   --     fn.getbufvar(buf, "&modifiable") == 1 and
--   --     isMarkdown(fn.expand("%:t")) then
--   --     return true
--   --   end
--   --   return false
--   -- end,
--   write_all_buffers = false, -- write all buffers when the current one meets `condition`
--   debounce_delay = 5000, -- saves the file at most every `debounce_delay` milliseconds
--   callbacks = { -- functions to be executed at different intervals
--     enabling = nil, -- ran when enabling auto-save
--     disabling = nil, -- ran when disabling auto-save
--     before_asserting_save = nil, -- ran before checking `condition`
--     before_saving = nil, -- ran before doing the actual save
--     after_saving = nil -- ran after doing the actual save
--   }
-- }

-- autosave markdown on a 5000 interval
function auto_save_markdown()
  print('testing new auto save')
  local save_interval = 5000 -- 5 seconds in milliseconds

  local autogroup_name = "autosave_markdown_group"
  -- Clear the autogroup to avoid adding duplicate autocommands
  vim.cmd("augroup " .. autogroup_name)
  vim.cmd("autocmd!")
  
  -- Set up the autocommand for saving Markdown files
  vim.cmd("autocmd FileType markdown autocmd " .. autogroup_name .. " CursorHoldI,TextChanged,CursorHold * lua save_markdown_file()")

  -- Set the 'updatetime' option to the save interval
  vim.cmd("set updatetime=" .. save_interval)

  -- Lua function to save the Markdown file
  _G.save_markdown_file = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local bufname = vim.api.nvim_buf_get_name(bufnr)

    -- Check if the current buffer is a Markdown file
    if string.match(bufname, "%.md$") or string.match(bufname, "%.markdown$") then
      vim.api.nvim_command("silent! write")
    end
  end
end

-- Call the function to enable auto-saving for Markdown files
-- auto_save_markdown()

-- save on a InsertLeave event
function auto_save_markdown_on_insert_leave()
  local autogroup_name = "autosave_markdown_on_insert_leave_group"
  -- Clear the autogroup to avoid adding duplicate autocommands
  vim.cmd("augroup " .. autogroup_name)
  vim.cmd("autocmd!")
  
  -- Set up the autocommand for saving Markdown files
  vim.cmd("autocmd FileType markdown autocmd " .. autogroup_name .. " InsertLeave * lua save_markdown_file_on_insert_leave()")

  -- Lua function to save the Markdown file
  _G.save_markdown_file_on_insert_leave = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local bufname = vim.api.nvim_buf_get_name(bufnr)

    -- Check if the current buffer is a Markdown file
    if string.match(bufname, "%.md$") or string.match(bufname, "%.markdown$") then
      vim.api.nvim_command("silent! write")
    end
  end
end

-- Call the function to enable auto-saving for Markdown files on InsertLeave
auto_save_markdown_on_insert_leave()

