
    programs = {
        neovim = {
            enable = true;
            viAlias = true;
            vimAlias = true;
            withNodeJs = true;
            plugins = with pkgs.vimPlugins; [
            {
                plugin = nvim-treesitter.withAllGrammars;
                config = ''
                 require('plugins.treesitter.lua')
                '';
            }
                nvim-lspconfig

                trouble-nvim
                plenary-nvim
                telescope-nvim
                {
                 plugin = harpoon2;
                 config = ''
                require('plugins.harpoon.lua')
                 '';
                }
                fidget-nvim
                mini-nvim
                undotree

                nvim-cmp
                cmp-nvim-lsp
                cmp-path
                cmp-buffer
                cmp-cmdline

                neodev-nvim

                luasnip
                cmp_luasnip
                lspkind-nvim
                vim-surround

                SchemaStore-nvim

                {
                 plugin = oil-nvim;
                 config = ''
                 require('plugins.oil.lua')
                 '';
                }
                {
                 plugin = catppuccin-nvim;
                 config = ''
                 require('plugins.colorschemes.lua')
                 '';
                }
                #(fromGitHub "HEAD" "tjdevries/express_line.nvim")
                zen-mode-nvim
                ];
        };
    };
