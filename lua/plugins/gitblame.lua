return {
  'f-person/git-blame.nvim',
  event = 'VeryLazy',
  config = function()
    vim.keymap.set('n', '<leader>gb', '<CMD>GitBlameToggle<CR>', {
      desc = 'Toggle Git Blame',
    })
    require('gitblame').setup {
      enabled = false,
      date_format = '%r',
    }
  end,
}
