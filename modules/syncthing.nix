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
        declarative = {
            overrideDevices = true;
            overrideFolders = true;
            devices = {
                "desktop" = { id = "HTAXXHN-QLHB4JU-LUIS3ZH-ZHXLJCC-N2N7TPL-NARK7JH-ISYILIM-GJPTHQA"; };
                "a50" = { id = "F7NTN7G-TPQTHTL-4AT4LPE-L7Q07TV-5U3HSMA-4KXRUUH-2ZGRSP2-NQXWQAQ"; };
                "e22" = { id = "OVGDYT2-Y4KPMNN-TRVWKMQ-DVLAIJM-SJLD72E-YI3ZK5Z-MGUZHGT-64VCAK"; };
            };
            folders = {
                "sync" = {
                    path = "/home/lauhkz/sync";
                    devices = [ "desktop" "a50" "e22" ];
                };
            };
        };
    };
}
