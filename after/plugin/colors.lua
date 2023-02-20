function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloatFloat", { bg = "none" })
end

-- ColorMyPencils()
vim.cmd("set termguicolors")

require("transparent").setup({
  enable = true
})

require("lush_theme.arctic")
vim.cmd("colorscheme arctic")
