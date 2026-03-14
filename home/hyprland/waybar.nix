{...}
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "left";
	modules-left = [ "hyprland/workspaces" ];
	modules-center = ["clock"];
	modules-right = ["cpu" "memory" "pulseaudio" "tray"];
      };
    };
    style = ''
      window#waybar { background: #282a35; color: #f8f8f2; }
      #workspaces button { padding: 0 5px; color: #6372a4; }
      #workspaces button.active { color: #ff79c6; }
    '';
  };
}
