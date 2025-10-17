local util = require("util")
local const = require("const")

return {
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "catppuccin" },
  },

  {
    "catppuccin/nvim",
    opts = {
      flavour = "mocha",
      highlight_overrides = {
        mocha = function(mocha)
          return {
            ["@string.special.symbol"] = { fg = mocha.mauve },
          }
        end,
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local options = opts.options or {}
      options.component_separators = {
        left = const.LUALINE.component.separators.left,
        right = const.LUALINE.component.separators.right,
      }
      options.section_separators = {
        left = const.LUALINE.section.separators.left,
        right = const.LUALINE.section.separators.right,
      }

      local sections = opts.sections or {}
      sections.lualine_a = {
        {
          "mode",
          separator = { left = const.LUALINE.section.separators.right },
          right_padding = const.LUALINE.section.padding,
        },
      }
      sections.lualine_b = { "branch" }
      sections.lualine_c = { LazyVim.lualine.pretty_path(), "diagnostics" }
      sections.lualine_x = { "encoding", "fileformat", "filetype" }
      sections.lualine_y = { "progress" }
      sections.lualine_z = {
        {
          "location",
          separator = { right = const.LUALINE.section.separators.left },
          left_padding = const.LUALINE.section.padding,
        },
      }

      opts.options = options
      opts.sections = sections

      return opts
    end,
  },

  {
    "nvim-mini/mini.starter",
    opts = {
      header = util.make_header(),
      items = {
        util.make_section("Telescope", {
          { "ff → Find file", LazyVim.pick() },
          { "ft → Find text", LazyVim.pick("live_grep") },
          { "rf → Recent files", LazyVim.pick("oldfiles") },
          { "sp → Select project", LazyVim.pick("projects") },
        }),
        util.make_section("Built-in", {
          { "n  → New file", "ene | startinsert" },
          { "q  → Quit", "qa" },
        }),
        util.make_section("Config", {
          { "c  → Config", LazyVim.pick.config_files() },
          { "l  → Lazy", "Lazy" },
          { "le → Lazy extras", "LazyExtras" },
        }),
        util.make_section("Session", {
          { "ss → Select session", [[lua require("persistence").select()]] },
          { "rs → Restore session", [[lua require("persistence").load()]] },
        }),
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },

  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      local sources = opts.picker.sources or {}
      local matcher = opts.picker.matcher or {}
      local win = opts.picker.win or {}

      for _, name in ipairs(const.SNACKS.picker.sources) do
        sources[name] = const.SNACKS.picker.source_config
      end

      matcher.history_bonus = true
      matcher.frecency = true
      matcher.cwd_bonus = true
      matcher.sort_empty = true

      win = {
        input = {
          keys = {
            ["<a-Up>"] = { "history_back", mode = { "i", "n" } },
            ["<a-Down>"] = { "history_forward", mode = { "i", "n" } },
          },
        },
      }

      opts.picker.sources = sources
      opts.picker.matcher = matcher
      opts.picker.win = win

      return opts
    end,
  },

  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        ghost_text = {
          enabled = false,
        },
        menu = {
          auto_show = false,
        },
      },
    },
  },

  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        auto_toggle_bufferline = false,
      },
    },
  },
}
