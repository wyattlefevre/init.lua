return {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return 40
      elseif term.direction == "vertical" then
        if vim.o.columns < 190 then
          return vim.o.columns - 10
        end
        return 180
      end
    end,
    open_mapping = [[<leader>;]],
    hide_numbers = true,
    direction = 'horizontal',
    insert_mappings = false,
  },
}
