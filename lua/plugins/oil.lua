return {
  'stevearc/oil.nvim',
  config = function()
    vim.keymap.set('n', '\\', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    require('oil').setup {
      default_file_explorer = true,
    }
  end,
}
