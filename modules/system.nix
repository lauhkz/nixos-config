{ config, pkgs, ... }:

{
  # Set your time zone.
  time.timeZone = "America/Argentina/Buenos_Aires";

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

  environment = {
   systemPackages = with pkgs; [
    ripgrep
    vim 
    lm_sensors

    jdk17

    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
   ];
   variables = {
    EDITOR = "nvim";
   };
  };

  security.rtkit.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;

  services = {
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
  };
}
