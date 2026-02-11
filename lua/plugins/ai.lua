return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },

    opts = {
      -- Claude (Anthropic) を使用
      strategies = {
        chat = {
          adapter = "anthropic",
        },
        inline = {
          adapter = "anthropic",
        },
      },

      -- Anthropic adapter の設定
      adapters = {
        anthropic = function()
          return require("codecompanion.adapters").extend("anthropic", {
            env = {
              api_key = "ANTHROPIC_API_KEY",
            },
            schema = {
              model = {
                default = "claude-sonnet-4-20250514",
              },
            },
          })
        end,
      },

      -- ログ設定（問題があるときに確認用）
      log_level = "INFO",
    },

    keys = {
      { "<leader>an", "<cmd>CodeCompanionChat<cr>", desc = "CodeCompanion: Claude chat" },
    },
  },
}
