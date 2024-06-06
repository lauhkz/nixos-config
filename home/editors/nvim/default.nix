{ config, pkgs, ... }:

let
fromGitHub = ref: repo: pkgs.vimUtils.buildVimPlugin {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
        url = "https://github.com/${repo}.git";
        ref = ref;
    };
};
in

{
    programs = {
        neovim = {
            enable = true;
            viAlias = true;
            vimAlias = true;
            withNodeJs = true;
            plugins = with pkgs.vimPlugins; [
                nvim-treesitter.withAllGrammars
                nvim-lspconfig

                trouble
                plenary-nvim
                telescope-nvim
                harpoon2
                fidget
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

                SchemasStore-nvim

                oil-nvim
                catppuccin-nvim
                (fromGitHub "HEAD" "tjdevries/express_line.nvim")
                zen-mode-nvim
                ];
        };

        extraConfig = ''
            lua << EOF
            ${builtins.readfile nvim/remaps.lua}
            ${builtins.readfile nvim/set.lua}
            ${builtins.readfile nvim/autocommands.lua}
            ${builtins.readfile nvim/terminal.lua}
            ${builtins.readfile nvim/plugins/colorschemes.lua}
            ${builtins.readfile nvim/plugins/harpoon.lua}
            ${builtins.readfile nvim/plugins/lsp.lua}
            ${builtins.readfile nvim/plugins/mini.lua}
            ${builtins.readfile nvim/plugins/neogen.lua}
            ${builtins.readfile nvim/plugins/trouble.lua}
            ${builtins.readfile nvim/plugins/undotree.lua}
            ${builtins.readfile nvim/plugins/zenmode.lua}
            ${builtins.readfile nvim/plugins/treesitter.lua}
        '';
    };
}
