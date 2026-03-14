{...}:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
	height = 40;
			modules-left = [ "hyprland/workspaces" ];
			modules-center = ["clock"];
			modules-right = ["cpu" "memory" "network" "pulseaudio" "battery" "tray"];
			"clock"= {
				"format"= "{=%H=%M}";
			};

			"network"= {
				"format-wifi"= "  {signalStrength}%";
				"format-ethernet"= "󰈀  Connected";
				"format-disconnected"= "  Offline";
			};
			"pulseaudio"= {
			    "format"= "{volume}% {icon}";
			    "format-muted"= " {volume}%";
			    "format-icons"= {
				"default"= ["" "" ""];
			    };
			    "scroll-step"= 1;
			    "on-click"= "pavucontrol";
			};			
		       "battery"= {
				"format"= "  {capacity}%";
				"format-charging"= " {capacity}%";
				"format-full"= "  {capacity}%";
			};

			"cpu"= {
				"format"= "  {usage}%";
			};

			"memory"= {
				"format"= "  {used}MB";
			};

			"tray"= {
				"spacing"= 10;
			};
			};
    };
    style = ''
      * { font-family: 'JetBrainsMono Nerd Font', monospace; font-size: 14px; }
      window#waybar { background: #f0f0f0; color: #0066ff; padding: 0 18px; }
      #workspaces button { padding: 0 5px; color: #6372a4; }
      #workspaces button.active { color: #0066ff; }
      #clock, #battery, #network, #cpu, #memory, #tray{ padding: 0 10px; color: #555555; }
    '';
	};
}
