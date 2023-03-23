vim.g.vim_markdown_frontmatter = 1
vim.g.vim_markdown_strikethrough = 1
vim.g.vim_markdown_strikethrough = 1
vim.g.vim_markdown_new_list_item_indent = 2
vim.g.vim_markdown_autowrite = 1
vim.g.vim_markdown_folding_style_pythonic = 1
vim.g.vim_markdown_folding_level = 2

-- _G.setup_markdown_highlights = function()
--   local highlights = [[
--     highlight markdownH1 guifg=#50fa7b gui=bold
--     highlight markdownH2 guifg=#ff79c6 gui=bold
--     highlight markdownH3 guifg=#ffb86c gui=bold
--     highlight markdownH4 guifg=#8be9fd gui=bold
--     highlight markdownH5 guifg=#f1fa8c gui=bold
--   ]]

--   vim.api.nvim_exec(highlights, false)
-- end

-- vim.cmd("augroup markdown_custom_highlights")
-- vim.cmd("autocmd!")
-- vim.cmd("autocmd FileType markdown lua _G.setup_markdown_highlights()")
-- vim.cmd("augroup END")

-- _G.setup_markdown_highlights = function()
--   local highlights = [[
--     highlight markdownH1 guifg=#50fa7b gui=bold
--     highlight markdownH2 guifg=#ff79c6 gui=bold
--     highlight markdownH3 guifg=#ffb86c gui=bold
--     highlight markdownH4 guifg=#8be9fd gui=bold
--     highlight markdownH5 guifg=#f1fa8c gui=bold
--     highlight mkdHeader guifg=#50fa7b gui=bold
--     highlight mkdHeaderDelimiter guifg=#50fa7b gui=bold
--     highlight mkdRule guifg=#50fa7b gui=bold
--   ]]

--   vim.api.nvim_exec(highlights, false)
-- end

-- vim.cmd("augroup markdown_custom_highlights")
-- vim.cmd("autocmd!")
-- vim.cmd("autocmd FileType markdown lua _G.setup_markdown_highlights()")
-- vim.cmd("augroup END")



-- local function setup_markdown_headings_colors()
--   print('test instide the markdown function')
--     local cmds = {
--         "highlight htmlH1 guifg=#50fa7b gui=bold",
--         "highlight htmlH2 guifg=#ff79c6 gui=bold",
--         "highlight htmlH3 guifg=#ffb86c gui=bold",
--         "highlight htmlH4 guifg=#8be9fd gui=bold",
--         "highlight htmlH5 guifg=#f1fa8c gui=bold",
--         "hi def link markdownH1 htmlH1",
--         "hi def link markdownH2 htmlH2",
--         "hi def link markdownH3 htmlH3",
--         "hi def link markdownH4 htmlH4",
--         "hi def link markdownH5 htmlH5",
--     }

--     for _, cmd in ipairs(cmds) do
--         vim.api.nvim_exec(cmd, false)
--     end
-- end
-- setup_markdown_headings_colors()

-- return {
--     setup_markdown_headings_colors = setup_markdown_headings_colors,
-- }


-- local function my_setup_markdown_headings_colors()
--     local cmds = {
--         "highlight htmlH1 guifg=#50fa7b gui=bold",
--         "highlight htmlH2 guifg=#ff79c6 gui=bold",
--         "highlight htmlH3 guifg=#ffb86c gui=bold",
--         "highlight htmlH4 guifg=#8be9fd gui=bold",
--         "highlight htmlH5 guifg=#f1fa8c gui=bold",
--         "hi def link markdownH1 htmlH1",
--         "hi def link markdownH2 htmlH2",
--         "hi def link markdownH3 htmlH3",
--         "hi def link markdownH4 htmlH4",
--         "hi def link markdownH5 htmlH5",
--     }

--     for _, cmd in ipairs(cmds) do
--         vim.api.nvim_exec(cmd, false)
--     end
-- end

-- -- Use an autocommand to call the function when the Markdown filetype is detected
-- vim.cmd('autocmd FileType markdown lua my_setup_markdown_headings_colors()')

-- local M = {}

-- function M.setup_markdown_headings_colors()
--   print('one more test')
--     local cmds = {
--         "highlight htmlH1 guifg=#50fa7b gui=bold",
--         "highlight htmlH2 guifg=#ff79c6 gui=bold",
--         "highlight htmlH3 guifg=#ffb86c gui=bold",
--         "highlight htmlH4 guifg=#8be9fd gui=bold",
--         "highlight htmlH5 guifg=#f1fa8c gui=bold",
--         "hi def link markdownH1 htmlH1",
--         "hi def link markdownH2 htmlH2",
--         "hi def link markdownH3 htmlH3",
--         "hi def link markdownH4 htmlH4",
--         "hi def link markdownH5 htmlH5",
--     }

--     for _, cmd in ipairs(cmds) do
--         vim.api.nvim_exec(cmd, false)
--     end
-- end

-- return M

