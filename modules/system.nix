{ config, pkgs, inputs, neovim,  ... }:

{

nixpkgs.overlays = [
    inputs.neovim.overlays.default
];

  # Set your time zone.
  time.timeZone = "America/Argentina/Buenos_Aires";
  time.hardwareClockInLocalTime = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_AR.UTF-8";
    LC_IDENTIFICATION = "es_AR.UTF-8";
    LC_MEASUREMENT = "es_AR.UTF-8";
    LC_MONETARY = "es_AR.UTF-8";
    LC_NAME = "es_AR.UTF-8";
    LC_NUMERIC = "es_AR.UTF-8";
    LC_PAPER = "es_AR.UTF-8";
    LC_TELEPHONE = "es_AR.UTF-8";
    LC_TIME = "es_AR.UTF-8";
  };

  console.useXkbConfig = true;

  fonts = {
    packages = with pkgs; [
      # icon fonts
      material-design-icons

      # normal fonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji

      # nerdfonts
      (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
      fira-code
    ];

    # use fonts specified by user rather than default ones
    enableDefaultPackages = false;

    # user defined fonts
    # the reason there's Noto Color Emoji everywhere is to override DejaVu's
    # B&W emojis that would sometimes show instead of some Color emojis
    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "Noto Color Emoji" ];
      sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
      monospace = [ "JetBrainsMono Nerd Font" "Noto Color Emoji" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  programs.dconf.enable = true;

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Shell
  programs.zsh.enable = true;


  environment = {
    shells = with pkgs; [ zsh ];
    systemPackages = with pkgs; [
      ripgrep
      vim
      lm_sensors
      xorg.xprop

      jdk17

      libsForQt5.qt5.qtquickcontrols2
      libsForQt5.qt5.qtgraphicaleffects

      nodejs

      nvim-pkg
    ];
    variables = {
      EDITOR = "nvim";
    };
  };

  security.rtkit.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  hardware.opengl.enable = true;

  services = {
    xserver = {
      enable = true;
      xkb = {
      layout = "us";
      options  = "ctrl:swapcaps, ";
    };
  };
    openssh = {
      enable = true;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
};

  users.users.lauhkz = {
    isNormalUser = true;
    description = "lauhkz";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  nix = {                                   # Nix Package Manager settings
  settings ={
    auto-optimise-store = true;           # Optimise syslinks
  };
  gc = {                                  # Automatic garbage collection
  automatic = true;
  dates = "weekly";
  options = "--delete-older-than 2d";
};
package = pkgs.nixFlakes;    # Enable nixFlakes on system
extraOptions = ''
experimental-features = nix-command flakes
keep-outputs          = true
keep-derivations      = true
'';
  };
nixpkgs.config.permittedInsecurePackages = [
                "freeimage-unstable-2021-11-01"
              ];
}
