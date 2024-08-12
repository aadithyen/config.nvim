return {
  'FabijanZulj/blame.nvim',
  config = function()
    require('blame').setup {
      date_format = '%R %d.%m',
    }
  end,
}
