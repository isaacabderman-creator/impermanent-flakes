{ config, pkgs, ... }: {
  imports = [
    ./hyprland/default.nix
    ./programs/git.nix
  ];
  home.username = "impermanent";
  home.homeDirectory = "/home/impermanent";
  
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
