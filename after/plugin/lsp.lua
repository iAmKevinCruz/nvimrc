-- import lsp-zero plugin safely
local lsp_status, lsp = pcall(require, "lsp-zero")
if not lsp_status then
  return
end
-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  return
end

-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
  return
end

-- load vs-code like snippets from plugins (e.g. friendly-snippets)
require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(), -- close completion window
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),
  -- sources for autocompletion
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- lsp
    { name = "luasnip" }, -- snippets
    { name = "buffer" }, -- text within current buffer
    { name = "path" }, -- file system paths
  }),
  -- configure lspkind for vs-code like icons
  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 50,
      ellipsis_char = "...",
    }),
  },
})

lsp.preset("recommended")

require'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
    },
  },
}

lsp.ensure_installed({
  'tsserver',
  'rust_analyzer',
  'theme_check',
  'eslint'
})

-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

-- Trying to make liquid work
-- lsp.configure('html', {
--     filetypes = { 'liquid' }
-- })
-- lsp.configure('theme_check', {
--     root_dir = function(fname)    
--         return vim.loop.cwd()
--     end;
-- })

-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
-- local cmp_mappings = lsp.defaults.cmp_mappings({
--   ['<C-y>'] = cmp.mapping.confirm({ select = true }),
-- })

-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil

-- lsp.setup_nvim_cmp({
--   mapping = cmp_mappings
-- })

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  print('test lsp on_attach')

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- from DJ
local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.emmet_ls.setup({
    -- on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'liquid' },
    init_options = {
      html = {
        options = {
          -- for possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#l79-l267
          ["bem.enabled"] = true,
        },
      },
    }
})

-- need to figure out this config. root always comes back not found
lspconfig.theme_check.setup {
  cmd = { 'theme-check-liquid-server' },
  capabilities = capabilities,
  filetypes = { 'liquid' },
  root_dir = lspconfig.util.find_git_ancestor
  -- root_dir = function(fname)
  --   return lspconfig.util.find_git_ancestor(fname)
  -- end,
  -- root_dir = function(fname)
  --   return vim.loop.cwd()
  -- end
  -- root_dir = function(startpath)
  --   return M.search_ancestors(startpath, matcher)
  -- end
}

lspconfig.marksman.setup({
    -- on_attach = on_attach,
    capabilities = capabilities,
    cmd = { 'marksman', 'server' },
    filetypes = { 'markdown' },
    -- root_dir = root_pattern('.git','.marksman.toml'),
    single_file_support = true,
    -- init_options = {
    --   html = {
    --     options = {
    --       -- for possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#l79-l267
    --       ["bem.enabled"] = true,
    --     },
    --   },
    -- }
})

lspconfig.grammarly.setup({
  cmd = { "grammarly-languageserver", "--stdio" },
  filetypes = { "markdown" },
  -- handlers = {
  --   ["$/updateDocumentState"] = <function 1>
  -- },
  init_options = {
    clientId = "client_BaDkMgx4X19X9UxxYRCXZo"
  },
  root_dir = lspconfig.util.find_node_modules_ancestor,
  single_file_support= true
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

vim.lsp.set_log_level("debug")

-- restart lsp server (not on youtube nvim video)
vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
