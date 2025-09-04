return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    local notify = require("notify")

    conform.setup({
      formatters = {
        biome = {
          command = "biome",
          args = { "check", "--apply-unsafe", "--stdin-file-path", "$FILENAME" },
          stdin = true,
        },
      },
      formatters_by_ft = {
        javascript = { "biome" },
        typescript = { "biome" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
        svelte = { "biome" },
        css = { "biome" },
        html = { "biome" },
        json = { "biome" },
        yaml = { "biome" },
        markdown = { "prettier" },
        graphql = { "biome" },
        liquid = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
      },
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        if not vim.g.disable_autoformat and not vim.b[args.buf].disable_autoformat then
          require("conform").format({ bufnr = args.buf })
        end
      end,
    })
    local function show_notification(message, level)
      notify(message, level, { title = "conform.nvim" })
    end

    vim.api.nvim_create_user_command("FormatToggle", function(args)
      local is_global = not args.bang
      if is_global then
        vim.g.disable_autoformat = not vim.g.disable_autoformat
        if vim.g.disable_autoformat then
          show_notification("Autoformat-on-save disabled globally", "warn")
        else
          show_notification("Autoformat-on-save enabled globally", "info")
        end
      else
        vim.b.disable_autoformat = not vim.b.disable_autoformat
        if vim.b.disable_autoformat then
          show_notification("Autoformat-on-save disabled for this buffer", "warn")
        else
          show_notification("Autoformat-on-save enabled for this buffer", "info")
        end
      end
    end, {
      desc = "Toggle autoformat-on-save",
      bang = true,
    })

    -- Add the keymap
    vim.keymap.set("n", "<leader>fx", ":FormatToggle<CR>", { desc = "Toggle format on save", silent = true })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
