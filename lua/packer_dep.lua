vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    use('mbbill/undotree')
    use('vim-airline/vim-airline')
    use('vim-airline/vim-airline-themes')
    use('tpope/vim-fugitive')
    use('junegunn/fzf')
    use('junegunn/fzf.vim')
    use('ray-x/go.nvim')
    use('ray-x/guihua.lua') -- recommanded if need floating window support
    use('ellisonleao/gruvbox.nvim')
    use("lukas-reineke/indent-blankline.nvim")

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use("folke/zen-mode.nvim")
    use("github/copilot.vim")
end)
