vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.api.nvim_exec('autocmd Filetype lua setlocal tabstop=2 shiftwidth=2 expandtab ', false)
vim.api.nvim_exec('autocmd Filetype json setlocal tabstop=2 shiftwidth=2 expandtab ', false)

vim.api.nvim_set_keymap('i', '<C-c>', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '>>', '>>^', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<<', '<<^', {noremap = true, silent = true})


local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'git@git.zhlh6.cn:wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(
  {
    function(use)
      use 'wbthomason/packer.nvim'
      use 'nvim-treesitter/nvim-treesitter'
      use {'neoclide/coc.nvim', branch = 'release'}

      -- Automatically set up your configuration after cloning packer.nvim
      -- Put this at the end after all plugins
      if packer_bootstrap then
        require('packer').sync()
      end
    end,
    config = {
      git = {
        default_url_format = 'git@git.zhlh6.cn:%s',
      },
    },
  }
)

require("nvim-treesitter.install").prefer_git = true
local parsers = require("nvim-treesitter.parsers").get_parser_configs()
for _, p in pairs(parsers) do
  p.install_info.url = p.install_info.url:gsub(
    "https://github.com/",
    "git@git.zhlh6.cn:"
  )
end

vim.g.coc_global_extensions = {
  'coc-sumneko-lua',
}
-- vim.g.coc_disable_uncaught_error = true

