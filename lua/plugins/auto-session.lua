return {
  {
    'rmagatti/auto-session',
    lazy = false,
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    opts = {
      auto_session_suppress_dirs = { '~/', '~/Downloads', '/' },
      auto_save_enabled = true,
      auto_restore_enabled = true,
    },
  },
}
