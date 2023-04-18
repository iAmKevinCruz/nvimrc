
local ai_status, ai = pcall(require, "vim-ai")
if not ai_status then
  return
end

vim.g.vim_ai_complete = {
  engine = "complete",
  options = {
    model = "text-davinci-003",
    max_tokens = 1000,
    temperature = 0.1,
    request_timeout = 20,
  },
}

vim.g.vim_ai_edit = {
  engine = "complete",
  options = {
    model = "gpt-4",
    max_tokens = 1000,
    temperature = 0.1,
    request_timeout = 20,
  },
}

local initial_chat_prompt = [[
>>> system

You are a general assistant.
If you attach a code block add syntax type after ``` to enable syntax highlighting.
]]

vim.g.vim_ai_chat = {
  options = {
    model = "gpt-4",
    max_tokens = 1000,
    temperature = 1,
    request_timeout = 20,
    initial_prompt = initial_chat_prompt,
  },
  ui = {
    code_syntax_enabled = 1,
    populate_options = 0,
    open_chat_command = "below new | call vim_ai#MakeScratchWindow()",
  },
}


