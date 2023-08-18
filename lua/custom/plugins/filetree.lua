-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
  },
  config = function ()
    require('neo-tree').setup {}
  end,
  -- keys = {
  --   {"n", "<leader>e", ":Neotree toggle<CR>"}
  -- },
}
