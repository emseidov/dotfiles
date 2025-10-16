local M = {}

M.SNACKS = {
  picker = {
    source_config = {
      -- hidden = true,
      -- ignored = true,
      -- exclude = {
      --   ".git",
      --   ".DS_Store",
      --   "node_modules",
      --   ".clj-kondo",
      --   ".shadow-cljs",
      --   "target",
      -- },
    },
    sources = { "explorer", "files", "grep", "grep_buffer", "grep_word" },
  },
}

M.LUALINE = {
  component = {
    separators = { left = "", right = "" },
  },
  section = {
    separators = { left = "", right = "" },
    padding = 2,
  },
}

return M
