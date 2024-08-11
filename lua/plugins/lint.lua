return {

  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        markdown = { 'markdownlint' },
        go = { 'golangcilint' },
        gomod = { 'golangcilint' },
      }

      lint.linters.golangcilint.args = {
        'run',
        '-c',
        'linters/golangci.yml',
        '--out-format',
        'json',
        '--show-stats=false',
        '--print-issued-lines=false',
        '--print-linter-name=false',
        function()
          return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':h')
        end,
      }

      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
}
