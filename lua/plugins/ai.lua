return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },

    opts = {
      -- ここが重要（v18系の正しい指定）
      interactions = {
        chat = {
          adapter = {
            name = "gemini",
            model = "gemini-2.5-flash",
          },
        },
      },

      -- ログ見たいとき（あとで消してOK）
      opts = {
        log_level = "DEBUG",
      },

      -- GEMINI_API_KEY を読ませる（デフォルトでも拾うことが多いけど明示しておく）
      adapters = {
        http = {
          gemini = function()
            return require("codecompanion.adapters").extend("gemini", {
              env = { api_key = vim.env.GEMINI_API_KEY },
            })
          end,
        },
      },
    },

    keys = {
      { "<leader>an", "<cmd>CodeCompanionChat<cr>", desc = "CodeCompanion: New chat" },
    },
  },
}
