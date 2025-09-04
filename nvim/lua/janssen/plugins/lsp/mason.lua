-- return {
--   "williamboman/mason.nvim",
--   dependencies = {
--     "williamboman/mason-lspconfig.nvim",
--     "WhoIsSethDaniel/mason-tool-installer.nvim",
--     "neovim/nvim-lspconfig.nvim",
--   },
--   config = function()
--     -- import mason
--     local mason = require("mason")
--
--     -- import mason-lspconfig
--     local mason_lspconfig = require("mason-lspconfig")
--
--     local mason_tool_installer = require("mason-tool-installer")
--
--     -- enable mason and configure icons
--     mason.setup({
--       ui = {
--         icons = {
--           package_installed = "✓",
--           package_pending = "➜",
--           package_uninstalled = "✗",
--         },
--       },
--     })
--
--     mason_lspconfig.setup({
--       -- list of servers for mason to install
--       ensure_installed = {
--         "tsserver",
--         "html",
--         "cssls",
--         "tailwindcss",
--         "svelte",
--         "lua_ls",
--         "graphql",
--         "emmet_ls",
--         "prismals",
--         "pyright",
--       },
--     })
--
--     mason_tool_installer.setup({
--       ensure_installed = {
--         "prettier", -- prettier formatter
--         "prettierd", -- prettier formatter
--         "stylua", -- lua formatter
--         "isort", -- python formatter
--         "black", -- python formatter
--         "pylint",
--         "eslint_d",
--       },
--     })
--   end,
-- }
return {
  "williamboman/mason.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- Set up mason first
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- Make sure lspconfig is loaded before mason-lspconfig
    require("lspconfig")

    -- Now it's safe to set up mason-lspconfig
    require("mason-lspconfig").setup({
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
      },
    })

    -- Optional: tool installer
    require("mason-tool-installer").setup({
      ensure_installed = {
        "prettier",
        "biome",
        "prettierd",
        "stylua",
        "isort",
        "black",
        "pylint",
        "eslint_d",
      },
    })
  end,
}
