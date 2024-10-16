return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      require('ibl').setup {
        indent = {
          char = '▏',
        },
        scope = {
          show_start = false,
          show_end = false,
        },
        exclude = {
          buftypes = {
            'lspinfo',
            'packer',
            'checkhealth',
            'help',
            'dashboard',
            '',
          },
        },
      }
    end,
  },
}
