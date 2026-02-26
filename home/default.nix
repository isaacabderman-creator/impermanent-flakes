{ config, pkgs, ... }: {
  imports = [
    ./hyprland/default.nix
    ./programs/git.nix
  ];
  home.username = "impermanent";
  home.homeDirectory = "/home/impermanent";
  
  home.stateVersion = "25.11";  
  home.packages = with pkgs; [
# Hyprland stack

  swww

  hyprlock

  hypridle

  hyprshot

  # Bar + launcher

  waybar

  # Terminal

  kitty

  # Theming

  matugen

  # Notifications

  mako

  # File manager

  yazi

  # Clipboard

  wl-clipboard

  cliphist

  # Audio

  pavucontrol

  networkmanagerapplet
  pamixer
  # System

  nix-output-monitor

  # Utilities

  brightnessctl

  playerctl

  grim

  slurp

  wlsunset

  # Fonts

  nerd-fonts.jetbrains-mono
  ];
}
