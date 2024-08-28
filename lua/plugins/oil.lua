return {
  'stevearc/oil.nvim',
  config = function()
    vim.keymap.set('n', '\\', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    require('oil').setup {
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
        is_always_hidden = function (name, _)
         if name == ".DS_Store" then
          return true
         end
          return false
        end
      },
    }
  end,
}
