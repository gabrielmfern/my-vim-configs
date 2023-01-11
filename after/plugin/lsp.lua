local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
  'rust_analyzer',
  'angularls',
  'cssls',
  'cssmodules_ls',
  'dockerls',
  'html',
  'jsonls',
  'opencl_ls',
  'sqlls',
  'zls',
  'yamlls',
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),

  ['<C-y>'] = cmp.mapping.confirm({ select = true }),

  ["<C-Space>"] = cmp.mapping.complete(),
  ["<C-q>"] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),

  ['<C-u>'] = cmp.mapping.scroll_docs(-4),
  ['<C-d>'] = cmp.mapping.scroll_docs(4),
})

lsp.setup_nvim_cmp({
  completion = {
    completeopt = "menu,menuone,noinsert",
  },
  experimental = {
    ghost_text = true,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "path" },
    { name = "buffer", keyword_length = 5 },
  },
  mapping = cmp_mappings,
})

lsp.set_preferences({
  suggest_lsp_servers = true,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

lsp.on_attach(function (_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', 'FF', vim.lsp.buf.format, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, bufopts)

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)

  vim.keymap.set('n', 'g[', vim.diagnostic.goto_next, bufopts)
  vim.keymap.set('n', 'g]', vim.diagnostic.goto_prev, bufopts)
  vim.diagnostic.config({ virtual_text = true })
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local opts = {
        focusable = false,
        noremap = true,
        silent = true,
        close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
        source = 'always',
        scope = 'cursor',
      }

      vim.diagnostic.open_float(nil, opts)
    end
  })
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
})
