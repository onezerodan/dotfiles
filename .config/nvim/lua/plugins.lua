return require('packer').startup(function()
    

    -- Lua line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },

    }

    -- Syntax highlight
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Color theme
    use {  "projekt0n/github-nvim-theme",
        after = "lualine.nvim",
    }

    -- Autocomplete
    use {'neoclide/coc.nvim', branch = 'release'}

    -- File tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        config = function() require'nvim-tree'.setup {} end
    }

    -- File finder
    use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
    }

    --  highlight colors
    use "lilydjwg/colorizer"

    -- Auto close parentheses
    use 'jiangmiao/auto-pairs'

    -- Dashboard
    use'glepnir/dashboard-nvim'

end)
