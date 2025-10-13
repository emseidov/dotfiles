return {
  {
    "olimorris/codecompanion.nvim",
    init = function()
      require("extensions.codecompanion-notification").init()
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim", version = false },
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/codecompanion-history.nvim",
    },
    cmd = { "CodeCompanion", "CodeCompanionChat" },
    opts = {
      extensions = {
        history = {
          opts = {
            keymap = "<leader>ah",
            continue_last_chat = false,
          },
        },
      },
      display = {
        chat = {
          window = {
            width = 0.4,
            opts = {
              wrap = true,
              number = false,
              relativenumber = false,
            },
          },
        },
      },
      strategies = {
        chat = {
          adapter = "copilot",
          roles = { user = "Me", llm = "Copilot" },
          keymaps = {
            clear = { modes = { n = "<leader>ac" } },
            yank_code = { modes = { n = "<leader>ay" } },
            stop = { modes = { n = "<leader>as" } },
            change_adapter = { modes = { n = "<leader>aC" } },
          },
        },
        inline = {
          keymaps = {
            accept_change = { modes = { n = "<leader>ada" } },
            reject_change = { modes = { n = "<leader>adr" } },
          },
          adapter = "copilot",
        },
        agent = { adapter = "copilot" },
      },
    },
  },
}
