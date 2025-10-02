local function get_ruff_cmd()
  local venv = vim.fn.getenv("VIRTUAL_ENV")
  if venv ~= vim.NIL and venv ~= "" then
    return { venv .. "/bin/ruff", "server", "--preview" }
  end
  return { "ruff", "server", "--preview" }
end

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      vtsls = {
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
        end,
      },
      basedpyright = {
        settings = {
          basedpyright = {
            typeCheckingMode = "off",
          },
        },
      },
      ruff = {
        mason = false,
        cmd = get_ruff_cmd(),
      },
    },
  },
}
