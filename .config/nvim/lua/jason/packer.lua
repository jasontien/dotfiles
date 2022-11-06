-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)

    -- Plugin Management 
    use {"wbthomason/packer.nvim"}
    use {"nvim-lua/plenary.nvim"}
    use {"nvim-lua/popup.nvim"}

    -- UI
    use {"kyazdani42/nvim-web-devicons"}
    use {"gruvbox-community/gruvbox"}
    use {
        "nvim-lualine/lualine.nvim",
        requires = {"nvim-web-devicons"}
    }

    -- Which Key
    use {"folke/which-key.nvim"}

    -- Git
    use {"TimUntersberger/neogit"}

   -- File Explorer 
    use {"scrooloose/nerdtree"}

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }

    -- Fuzzy Finder
    use {"junegunn/fzf"}
    use {"junegunn/fzf.vim"}

    use {
        "ibhagwan/fzf-lua",
        requires = {"junegunn/fzf"}
    }

    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
            {"nvim-telescope/telescope-fzf-native.nvim", run = "make"},
            "nvim-telescope/telescope-project.nvim",
            "cljoly/telescope-repo.nvim",
            "nvim-telescope/telescope-file-browser.nvim", {
            "ahmedkhalf/project.nvim",
        }}
    }

    -- Formatter
    use {"sbdchd/neoformat"}

    -- Cheatsheet
    use {"sudormrfbin/cheatsheet.nvim"}

    -------------------------
    -- Auto Completion
    -------------------------

    use "windwp/nvim-autopairs"

    use {"hrsh7th/nvim-cmp"}
    use {"hrsh7th/cmp-buffer"}
    use {"hrsh7th/cmp-path"}
    use {"hrsh7th/cmp-cmdline"}
    use {"hrsh7th/cmp-nvim-lsp"}
    use {"hrsh7th/cmp-nvim-lua"}
    use {"saadparwaiz1/cmp_luasnip"}

--     -- snippets
    use {'L3MON4D3/LuaSnip'}


    -- LSP
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use "jose-elias-alvarez/null-ls.nvim"             -- for formatters and linters
    use "ray-x/lsp_signature.nvim"                    -- Pop up function definitions when typing a function call
    use "gpanders/editorconfig.nvim"                  -- Obey editorconfig files
    use({ "glepnir/lspsaga.nvim", branch = "main", }) -- Better UI around renames and LSP diagnistics
    use {
    "ThePrimeagen/refactoring.nvim",                -- Refactoring tools
    requires = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" }
    }

    use "ThePrimeagen/vim-be-good"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
