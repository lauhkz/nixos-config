{ pkgs, config, lib, user, ... }:
{
 programs = {
  neovim = {
   enable = true;
   viAlias = true;
   vimAlias = true;
   withNodeJs = true;
   withPython3 = true;
   extraConfig = ''
    lua << EOF
    require("config.set")
    require("config.remap")
    require("config.lsp")
    EOF
   '';
   plugins = with pkgs.vimPlugins; [
     {
     plugin = rose-pine;
     type = "lua";
     config = ''
      require("config.colors")
     '';
     }
     {
      plugin = telescope-nvim;
      type = "lua";
      config = ''
       require("config.telescope")
      '';
     }
     plenary-nvim
     popup-nvim
     {
      plugin = trouble-nvim;
      type = "lua";
      config = ''
       require("config.trouble")
      '';
     }
     {
      plugin = nvim-treesitter.withAllGrammars;
      type = "lua";
      config = ''
       require("config.treesitter")
       '';
     }
     playground
     {
      plugin = harpoon;
      type = "lua";
      config = ''
       require("config.harpoon")
       '';
     }
     {
      plugin = refactoring-nvim;
      type = "lua";
      config = ''
        require("config.refactoring")
      '';
     }
     {
      plugin = undotree;
      type = "lua";
      config = ''
       require("config.undotree")
      '';
     }
     {
      plugin = vim-fugitive;
      type = "lua";
      config = ''
       require("config.fugitive")
      '';
     }
     vim-nix
     rust-tools-nvim
     nvim-treesitter-context
     lsp-zero-nvim
     nvim-lspconfig
     nvim-cmp
     cmp-buffer
     cmp-path
     cmp_luasnip
     cmp-nvim-lsp
     cmp-nvim-lua
     luasnip
     friendly-snippets
     {
      plugin = zen-mode-nvim;
      type = "lua";
      config = ''
       require("config.zenmode")
      '';
     }
   ];
    extraPackages = with pkgs; [
      gopls
      haskell-language-server
      jsonnet-language-server
      lua-language-server
      manix
      nil
      nodePackages."@prisma/language-server"
      nodePackages."bash-language-server"
      nodePackages."diagnostic-languageserver"
      nodePackages."dockerfile-language-server-nodejs"
      nodePackages."graphql-language-service-cli"
      nodePackages."pyright"
      nodePackages."typescript"
      nodePackages."typescript-language-server"
      nodePackages."vscode-langservers-extracted"
      nodePackages."yaml-language-server"
      python310Packages.black
      rust-analyzer
      rustfmt
      terraform-ls
    ];
  };
 };
 xdg.configFile.nvim = {
    recursive = true;
    source = ../../config/nvim;
  };
}
