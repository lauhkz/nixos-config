{ config, pkgs, ... }:

let
    extra = ''
    set +x
    ${pkgs.util-linux}/bin/setterm -blank 0 -powersave off -powerdown 0
    ${pkgs.xorg.xset}/bin/xset s off
    ${pkgs.xorg.setxkbmap}/bin/setxkbmap -option ctrl:swapcaps
    ${pkgs.autorandr}/bin/autorandr --change
    '';

    polybarOpts = ''
        ${pkgs.nitrogen}/bin/nitrogen --restore &
        ${pkgs.blueman}/bin/blueman-applet &
        ${pkgs.networkmanagerapplet}/bin/nm-applet --sm-disable --indicator &
        ${pkgs.bat-lvl}/bin/battery-level-check &
    '';
    in
{
    xresources.properties = {
        "xft.dpi" = 125;
        "xft.autohint" = 0;
        "xft.hintstyle" = "hintfull";
        "Xft.antialias" = 1;
        "Xft.rgba" = "rgb";
    };

    home.packages = with pkgs; [
        dialog
        networkmanager_dmenu
        networkmanagerapplet
        nitrogen
        xorg.xkbcomp
        xorg.xmodmap
        xorg.xrandr
    ];

    xsession = {
        enable = true;

        initExtra = extra + polybarOpts;

        windowManager.xmonad = {
            enable = true;
            enableContribAndExtras = true;
            extraPackages = hp: [
                hp.dbus
                hp.monad-logger
            ];
            config = ./config.hs;
        };
    };
}
