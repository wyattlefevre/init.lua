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
  -- return {
  --   'navarasu/onedark.nvim',
  --   config = function()
  --     require('onedark').setup({
  --       style = 'dark',
  --       transparent = true, -- Show/hide background
  --       toggle_style_key = '<leader>ts'
  --     })
  --     require('onedark').load()
  --     vim.o.bg = 'dark'
  --   end
  -- }
  return {
    'rebelot/kanagawa.nvim',
    config = function()
      require('kanagawa').setup({
        compile = false,  -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true,   -- do not set background color
        dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = {             -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors) -- add/modify highlights
          return {}
        end,
        theme = "dragon",  -- Load "dragon" theme when 'background' option is not set
        background = {   -- map the value of 'background' option to a theme
          dark = "dragon", -- try "dragon" !
          light = "lotus"
        },
      })
      vim.cmd("colorscheme kanagawa")
      vim.o.bg = 'dark'
    end
  }
end
