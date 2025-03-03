-- https://www.youtube.com/watch?v=ybUE4D80XSk&ab_channel=JoseanMartinez
return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
      },
      -- format_on_save = {
      --   lsp_fallback = true,
      --   async = false,
      -- }
    })
    vim.keymap.set({ "n", "v" }, "<leader>d", function()
      conform.format({
        lsp_fallback = true,
        async = false,
      })
    end)
  end
}

