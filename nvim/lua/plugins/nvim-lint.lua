return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      python = { "dmypy" },
    },
    linters = {
      dmypy = {
        cmd = function()
          local venv = vim.fn.getenv("VIRTUAL_ENV")
          if venv ~= vim.NIL and venv ~= "" then
            return venv .. "/bin/dmypy"
          end
          return "dmypy"
        end,
      },
    },
  },
}
