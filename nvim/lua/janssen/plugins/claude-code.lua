return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  config = function()
    require("claude-code").setup({
      -- your config stays the same...
      window = {
        split_ratio = 0.3,
        position = "float",
        enter_insert = true,
        hide_numbers = true,
        hide_signcolumn = true,
        float = {
          width = "90%",
          height = "90%",
          row = "center",
          col = "center",
          relative = "editor",
          border = "double",
        },
      },
      refresh = {
        enable = true,
        updatetime = 100,
        timer_interval = 1000,
        show_notifications = true,
      },
      git = {
        use_git_root = true,
      },
      shell = {
        separator = "&&",
        pushd_cmd = "pushd",
        popd_cmd = "popd",
      },
      command = "claude",
      command_variants = {
        continue = "--continue",
        resume = "--resume",
        verbose = "--verbose",
      },
      keymaps = {
        toggle = {
          normal = "<C-,>",
          terminal = "<C-,>",
          variants = {
            continue = "<leader>cC",
            verbose = "<leader>cV",
          },
        },
        window_navigation = true,
        scrolling = true,
      },
    })

    -- Extra keymap if you want it (from docs)
    vim.keymap.set("n", "<leader>cc", "<cmd>ClaudeCode<CR>", { desc = "Toggle Claude Code" })

    -- Or if you want to call it directly somewhere:
    -- vim.cmd[[ClaudeCode]]
  end,
}
