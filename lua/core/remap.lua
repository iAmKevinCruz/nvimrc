vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move group of code up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Save shortcut
vim.keymap.set("n", "<C-s>", ":wa<CR>")

-- terminal mappings
vim.keymap.set('n', '<leader>;', ':bo sp<CR>:resize 10<CR>:term<CR>i') ----------------------  opens a terminal at the bottom of all windows
vim.cmd([[ autocmd TermClose * execute "bdelete! " . expand("<abuf>") ]]) --------  closes the terminal without showing process exited and requiring <CR>
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Nvim Tree Map Stuffmap
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

-- Split window controls
vim.keymap.set('n', '<leader>sv', '<C-w>v') -- split window vertically
vim.keymap.set('n', '<leader>sh', '<C-w>s') -- split window vertically
vim.keymap.set('n', '<leader>se', '<C-w>=') -- make split windows equal size
vim.keymap.set('n', '<leader>sx', ':close<CR>') -- close split pane
-- vim.keymap.set('n', '<C-Left>', '<C-w>Left') -- move to left window
-- vim.keymap.set('n', '<C-Right>', '<C-w>Right') -- move to right window
-- vim.keymap.set('n', '<C-Up>', '<C-w>Up') -- move to up window
-- vim.keymap.set('n', '<C-Down>', '<C-w>Down') -- move to down window

-- Number increments
vim.keymap.set('n', '<leader>+', '<C-a>')
vim.keymap.set('n', '<leader>-', '<C-x>')

-- vim-maximizer
vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- Tab inside nvim controls
vim.keymap.set("n", "<leader>to", ':tabnew<CR>') -- open new tab
vim.keymap.set("n", "<leader>tx", ':tabclose<CR>') -- close tab
vim.keymap.set("n", "<A-.>", ':tabn<CR>') -- go to next tab
vim.keymap.set("n", "<A-,>", ':tabp<CR>') -- go to prev tab
vim.keymap.set("n", "<A->>", ':+tabmove<CR>') -- move tab to the right
vim.keymap.set("n", "<A-<>", ':-tabmove<CR>') -- move tab to the left
-- vim.keymap.set("n", "<leader>tn", ':tabn<CR>') -- go to next tab
-- vim.keymap.set("n", "<leader>tp", ':tabp<CR>') -- go to prev tab

-- Tab lines from visual mode
vim.keymap.set("v", "<Tab>", '>') -- Tab Forward. Use '.' to repeat
vim.keymap.set("v", "<S-Tab>", '<') -- Tab Backward. Use '.' to repeat

-- Edit code without yanking the deleted code
vim.keymap.set("x", "<leader>p", [["_dP]]) -- Paste without copying replaced code
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- delete code
vim.keymap.set("n", "x", '"_x') -- delete code

-- Return to Normal mode from Insert Mode
vim.keymap.set("i", "jk", '<ESC>')

-- this will let me copy things into my system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Clear search highjlight
vim.keymap.set("n", "<leader>nh", ':nohlsearch<CR>')

-- Easy quit
vim.keymap.set("n", "<leader>q", ':q<CR>')

-- Close brackets and quotes
-- vim.keymap.set("i", "{", "{{$1}}")
vim.keymap.set("i", "''", "''<ESC>i")
vim.keymap.set("i", '""', '""<ESC>i')
vim.keymap.set("i", '((', '()<ESC>i')
vim.keymap.set("i", '{{', '{}<ESC>i')
vim.keymap.set("i", '[[', '[]<ESC>i')
vim.keymap.set("i", '<<', '<><ESC>i')

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)





vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Formats using LSP
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- From what I can tell, change all instances of this selected text
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make file into an executable I think
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- takes me to my packer.lua file
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/core/packer.lua<CR>");

-- Dont know what this does
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
