return {
  "ThePrimeagen/harpoon",
  keys = {
    -- { "<leader>h", "<cmd>Telescope harpoon marks<CR>", desc = "Harpoon: view marks" },
    { "<leader>h", "<cmd>lua require(\"harpoon.ui\").toggle_quick_menu()<CR>", desc = "Harpoon: view marks" },
    { "<leader>m", "<cmd>lua require(\"harpoon.mark\").add_file()<CR>", desc = "Harpoon: mark file" },
    { "<leader>hj", "<cmd>lua require(\"harpoon.ui\").nav_file(1)<CR>", desc = "Harpoon: nav file 1" },
    { "<leader>hk", "<cmd>lua require(\"harpoon.ui\").nav_file(2)<CR>", desc = "Harpoon: nav file 2" },
    { "<leader>hl", "<cmd>lua require(\"harpoon.ui\").nav_file(3)<CR>", desc = "Harpoon: nav file 3" },
    { "<leader>h;", "<cmd>lua require(\"harpoon.ui\").nav_file(4)<CR>", desc = "Harpoon: nav file 4" },
  }
}
