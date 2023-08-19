local envTheme = os.getenv("COLOR_THEME")

if envTheme == "LIGHT" then
  return {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').setup({
        style = 'light',
        transparent = true, -- Show/hide background
        toggle_style_key = '<leader>ts'
      })
      require('onedark').load()
      vim.o.bg = 'light'
    end
  }
else
  return {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').setup({
        style = 'warm',
        transparent = true, -- Show/hide background
        toggle_style_key = '<leader>ts'
      })
      require('onedark').load()
      vim.o.bg = 'dark'
    end
  }
end

