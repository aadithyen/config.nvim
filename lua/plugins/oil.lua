return {
  'stevearc/oil.nvim',
  config = function()
    vim.keymap.set('n', '\\', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    require('oil').setup {
      default_file_explorer = true,
      columns = {
        'icon',
        'size',
        'mtime',
      },
      skip_confirm_for_simple_edits = true,
      delete_to_trash = true,
      watch_for_changes = true,
      view_options = {
        show_hidden = true,
        natural_order = true,
        is_always_hidden = function(name, _)
          if name == '.DS_Store' then
            return true
          end
          return false
        end,
      },
    }
  end,
}
