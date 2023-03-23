require("obsidian").setup({
  -- dir = "~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Obsidian/Vault\ of\ Lykos/",
  dir = "~/Library/Mobile Documents/com~apple~CloudDocs/Obsidian/Vault of Lykos",
  notes_subdir = "nvim_notes",
  daily_notes = {
    folder = '3. Fleeting/Journal/Daily'
  },
  templates = {
    subdir = "Templates",
    date_format = "%Y-%m-%d-%a",
    time_format = "%H:%M"
  },
  ensure_installed = { "markdown", "markdown_inline", ... },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "markdown" },
  },
  -- disable_frontmatter = true,
  note_frontmatter_func = function(note)
    local out = { id = note.id, aliases = note.aliases, tags = note.tags, created = note.cday, updated = note.mday }
    -- `note.metadata` contains any manually added fields in the frontmatter.
    -- So here we just make sure those fields are kept in the frontmatter.
    if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end
    return out
  end,
  note_id_func = function(title)
    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
    local suffix = ""
    if title ~= nil then
      -- If title is given, transform it into valid file name.
      suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      -- If title is nil, just add 4 random uppercase letters to the suffix.
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end
    -- return tostring(os.time()) .. "-" .. suffix
    return title
  end,
  completion = {
    nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
  }
})


-- Keymaps for Obsidian
vim.keymap.set('n', '<leader>ot', ':ObsidianToday<CR>')
vim.keymap.set('n', '<leader>oT', ':ObsidianTemplate<CR>')
vim.keymap.set('n', '<leader>oy', ':ObsidianYesterday<CR>')
vim.keymap.set('n', '<leader>of', ':ObsidianFollowLink<CR>')
vim.keymap.set('n', '<leader>os', ':ObsidianSearch<CR>')
vim.keymap.set('n', '<leader>oo', ':ObsidianOpen<CR>')
vim.keymap.set('n', '<leader>ob', ':ObsidianBacklinks<CR>')
vim.keymap.set('n', '<leader>on', ':ObsidianNew ')
-- vim.keymap.set('n', '<leader>on', function ()
--   search = vim.fn.input("NoteName > ")
--   vim.cmd ('ObsidianNew' + search)
-- end)
vim.keymap.set('n', '<leader>om', ':ObsidianLink<CR>')
vim.keymap.set('n', '<leader>ol', ':ObsidianLinkNew<CR>')

