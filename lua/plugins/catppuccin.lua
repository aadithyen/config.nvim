return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        background = { -- :h background
          light = 'latte',
          dark = 'mocha',
        },
        dim_inactive = {
          enabled = true, -- dims the background color of inactive window
          shade = 'dark',
          percentage = 0.20, -- percentage of the shade to apply to the inactive window
        },
        integrations = {
          mason = true,
          neotree = true,
          lsp_trouble = true,
          which_key = true,
        },
      }
    end,
    init = function()
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
