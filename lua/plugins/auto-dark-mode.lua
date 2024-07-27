return {
  {
    'f-person/auto-dark-mode.nvim',
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.opt.background = 'dark'
      end,
      set_light_mode = function()
        vim.opt.background = 'light'
      end,
    },
  },
}
