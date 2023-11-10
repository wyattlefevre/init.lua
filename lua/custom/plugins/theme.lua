local envTheme = os.getenv("COLOR_THEME")
local darkTheme = "onedark"

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
  -- return {
  --   'Mofiqul/vscode.nvim',
  --   config = function()
  --     require('vscode').setup({
  --       -- Alternatively set style in setup
  --       style = 'light',
  --
  --       -- Enable transparent background
  --       transparent = true,
  --
  --       -- Enable italic comment
  --       italic_comments = true,
  --
  --       -- Disable nvim-tree background color
  --       -- disable_nvimtree_bg = true,
  --
  --     })
  --     require('vscode').load()
  --     vim.o.bg = 'light'
  --   end
  -- }
else
  if darkTheme == "onedark" then
    return {
      'navarasu/onedark.nvim',
      config = function()
        require('onedark').setup({
          style = 'dark',
          transparent = true, -- Show/hide background
          toggle_style_key = '<leader>ts'
        })
        require('onedark').load()
        vim.o.bg = 'dark'
      end
    }
  end
  if darkTheme == "kanagawa" then
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
          transparent = true,    -- do not set background color
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
          background = {     -- map the value of 'background' option to a theme
            dark = "dragon", -- try "dragon" !
            light = "lotus"
          },
        })
        vim.cmd("colorscheme kanagawa")
        vim.o.bg = 'dark'
      end
    }
  end
  if darkTheme == "gruvbox" then
    return {
      'ellisonleao/gruvbox.nvim',
      config = function()
        require("gruvbox").setup({
          undercurl = true,
          underline = true,
          bold = true,
          italic = {
            strings = true,
            comments = true,
            operators = false,
            folds = true,
          },
          strikethrough = true,
          invert_selection = false,
          invert_signs = false,
          invert_tabline = false,
          invert_intend_guides = false,
          inverse = true, -- invert background for search, diffs, statuslines and errors
          contrast = "",  -- can be "hard", "soft" or empty string
          palette_overrides = {},
          overrides = {},
          dim_inactive = false,
          transparent_mode = false,
        })
        vim.cmd("colorscheme gruvbox")
      end
    }
  end
end
