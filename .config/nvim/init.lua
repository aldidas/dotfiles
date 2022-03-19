require('variables')
require('options')
require('keymaps')
require('plugins')

require('nvim-tree').setup({
  view = {
    width = 30,
    number = false,
    mappings = {
      list = {
        { key = "cf", action = "create" },
        { key = "<S-r>", action = "rename" }
      }
    }
  }
})
require('lualine').setup({
  options = {
    theme = 'dracula-nvim'
  }
})
require('neogit').setup({
  use_magit_keybindings = true
})
require('gitsigns').setup()

local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close()
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = function(fallback)
      if (cmp.visible()) then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if (cmp.visible()) then
        cmp.select_prev_item()
      else
        fallback()
      end
    end
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }
  }, {
    { name = 'buffer' }
  })
})

local lsp_installer = require('nvim-lsp-installer')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp_config = require('lspconfig')
lsp_installer.on_server_ready(function(server)
  local opts = {}
  if server.name == "sumneko_lua" then
    opts.settings = {
      Lua = {
        diagnostics = { globals = { 'vim' }}
      }
    }
  end
  lsp_config[server.name].setup {
    capabilities = capabilities
  }
  server:setup(opts)
end)

lsp_installer.settings({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  }
})
