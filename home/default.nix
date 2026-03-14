{ config, pkgs, ... }: {
  imports = [
    ./hyprland/default.nix
    ./programs/git.nix
    ./programs/zsh.nix
  ];
  home.username = "impermanent";
  home.homeDirectory = "/home/impermanent";
  home.file.".p10k.zsh".source = ./programs/p10k.zsh;
  home.file.".local/share/fonts/Satoshi".source = pkgs.fetchurl {
    url = "https://api.fontshare.com/v2/fonts/download/satoshi";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };
  home.stateVersion = "25.11";  
  home.packages = with pkgs; [
    swww
    hyprlock
    hypridle
    hyprshot
    waybar
    matugen
    mako
    yazi
    wl-clipboard
    cliphist
    pavucontrol
    networkmanagerapplet
    pamixer
    nix-output-monitor
    brightnessctl
    playerctl
    grim
    slurp
    wlsunset
    kdePackages.kdeconnect-kde
    nerd-fonts.jetbrains-mono
  ];
  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      window_padding_width = 20;
    };
  };
  programs.wofi = {
    enable = true;
    settings = {
      width = 400;
      height = 300;
      location = "center";
      show = "drun";
    };
  };
}
