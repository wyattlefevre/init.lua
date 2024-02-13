return {
  "ThePrimeagen/harpoon",
  keys = {
    -- { "<leader>h", "<cmd>Telescope harpoon marks<CR>", desc = "Harpoon: view marks" },
    { "<leader>h", "<cmd>lua require(\"harpoon.ui\").toggle_quick_menu()<CR>", desc = "Harpoon: view marks" },
    { "<leader>m", "<cmd>lua require(\"harpoon.mark\").add_file()<CR>", desc = "Harpoon: mark file" }
  }
}
