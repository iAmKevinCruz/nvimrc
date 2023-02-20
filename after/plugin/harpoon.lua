local map = vim.keymap.set
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")


vim.keymap.set("n", "<leader>h", mark.add_file)
vim.keymap.set("n", "<leader>hs", ui.toggle_quick_menu)


-- Shortcut to use numbers for harpoon
for i=0,9 do
   vim.keymap.set("n", '<leader>h'..i, function ()
        ui.nav_file(i)
   end)
end
