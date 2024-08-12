local function clock()
  return os.date '%H:%M'
end

local mode_icons = {
  n = '', -- NORMAL mode
  i = '', -- INSERT mode
  v = '󰈈', -- VISUAL mode
  [''] = '󰈈', -- VISUAL BLOCK mode
  V = '󰈈', -- VISUAL LINE mode
  c = '', -- COMMAND mode
  R = '󰈞', -- REPLACE mode
}

local function mode_icon()
  return mode_icons[vim.fn.mode()] or ''
end

local nvimbattery = {
  function()
    return require('battery').get_status_line()
  end,
}

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'justinhj/battery.nvim' },
  config = function()
    require('battery').setup {
      show_unplugged_icon = false,
    }
    require('lualine').setup {
      sections = {
        lualine_a = { clock, mode_icon },
        lualine_c = {
          { 'filename', file_status = false, path = 1 },
        },
        lualine_z = { nvimbattery },
        lualine_y = { 'location' },
        lualine_x = {
          function()
            return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
          end,
          'filetype',
        },
      },
      options = {
        icons_enabled = true,
        globalstatus = true,
        theme = 'catppuccin',
        component_separators = '',
        section_separators = { left = '', right = '' },
      },
    }
  end,
}
