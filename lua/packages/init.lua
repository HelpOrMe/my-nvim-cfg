-- :PackerSync to update packets

packer.startup(function()
    -- Packer
    use {'wbthomason/packer.nvim', opt = true}

    -- Extensions

    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'

    use 'nvim-treesitter/nvim-treesitter'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'terrortylor/nvim-comment'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    -- UI
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzf-native.nvim'

    use 'kyazdani42/nvim-tree.lua'
    use 'romgrk/barbar.nvim'
    use 'glepnir/dashboard-nvim'
    use 'itchyny/lightline.vim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use 'RishabhRD/popfix'
    use 'RishabhRD/nvim-lsputils'
    use 'folke/trouble.nvim'
    use 'akinsho/toggleterm.nvim'

    -- Rust
    use 'DingDean/wgsl.vim'

    -- https://www.nerdfonts.com/font-downloads
    use 'kyazdani42/nvim-web-devicons'
end)


-- Package configs

load {
    'packages.telescope',
    'packages.treesitter',
    'packages.dashboard',
    'packages.indent-blankline',
    'packages.trouble',
    'packages.barbar',
    'packages.nvim-tree',
    'packages.nvim-cmp',
    'packages.lsp',
    'packages.colorizer',
    'packages.comment',
    'packages.trouble',
    'packages.toggleterm'
}
