local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({
  function(use)
    use 'wbthomason/packer.nvim'
    -- My plugins here
    -- use 'foo1/bar1.nvim'
    -- use 'foo2/bar2.nvim'
    --
    --
    use {
      "nvim-lua/plenary.nvim"
    }

    use {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip"
    }

    use {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets"
    }

    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
    }

    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate"
    }

    use {
      "williamboman/mason.nvim",
      run = ":MasonUpdate"
    }

    use {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "jose-elias-alvarez/null-ls.nvim"
    }

    use {
      "folke/which-key.nvim"
    }

    use {
      "folke/tokyonight.nvim",
      "ellisonleao/gruvbox.nvim"
    }

    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional
      }
    }

    use {
      "numtostr/comment.nvim",
      config = function()
        require('comment').setup()
      end
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
})
