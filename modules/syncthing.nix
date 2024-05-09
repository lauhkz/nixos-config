{ pkgs, ... }:

{
    services.syncthing = {
        enable = true;
        dataDir = "/home/lauhkz";
        openDefaultPorts = true;
        configDir = "/home/lauhkz/.config/syncthing";
        user = "lauhkz";
        group = "users";
        guiAddress = "0.0.0.0:8384";
        overrideDevices = true;
        overrideFolders = true;
        settings = {
            devices = {
                "desktop" = { id = "RQV5WGI-GBAZ6MF-Q6BDE4G-XDLHZI7-YOXGJ5B-HFGGSYC-YD5ZGAR-DVM6KQG"; };
                "a50" = { id = "F7NTN7G-TPQTHTL-4AT4LPE-L7QO7TV-5U3HSMA-4KXRUUH-2ZGRSP2-NQXWQAQ"; };
                "e22" = { id = "OVGDYT2-Y4KPMNN-TRVWKMQ-DVLAIJM-SJLD72E-YI3ZK5Z-MGUZHGT-64VCVAK"; };
            };
            folders = {
                "sync" = {
                    path = "/home/lauhkz/sync";
                    devices = [ "desktop" ];
                };
                "org" = {
                    path = "/home/lauhkz/sync/2.Areas/Org";
                    devices = [ "desktop" "a50" "e22" ];
                    };
                "resources" = {
                    path = "/home/lauhkz/sync/3.Resources";
                    devices = [ "desktop" "a50" "e22" ];
                    };
            };
            gui = {
                user = "lauhkz";
                password = "Detonator Change Moneybags Chokehold Operate Precinct Runny Charter";
            };
        };
    };
}
