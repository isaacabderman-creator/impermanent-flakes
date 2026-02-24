{ config, pkgs, ... }: {
  home.username = "impermanent";
  home.homeDirectory = "/home/impermanent";

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    kitty
    waybar
    rofi
  ];
}
