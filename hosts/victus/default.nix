# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Indian/Antananarivo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "mg_MG.UTF-8";
    LC_IDENTIFICATION = "mg_MG.UTF-8";
    LC_MEASUREMENT = "mg_MG.UTF-8";
    LC_MONETARY = "mg_MG.UTF-8";
    LC_NAME = "mg_MG.UTF-8";
    LC_NUMERIC = "mg_MG.UTF-8";
    LC_PAPER = "mg_MG.UTF-8";
    LC_TELEPHONE = "mg_MG.UTF-8";
    LC_TIME = "mg_MG.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.impermanent = {
    isNormalUser = true;
    description = "ANDRIANARIMANANA Isaac Abderman";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    neovim
    git
    htop
    btop
    iputils
    kitty
    lshw
    nvtopPackages.nvidia
    firefox
    rubik
    nerd-fonts.ubuntu
    nerd-fonts.jetbrains-mono
  ];

  programs.hyprland.enable = true;
  services.geoclue2.enable = true;
  services.upower.enable = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  
  #GPU CONFIGURATION
  # ── Kernel params for NVIDIA ──────────────────────────────────────────────
  boot.kernelParams = [ "nvidia_drm.modeset=1" "nvidia.NVreg_PreserveVideoMemoryAllocations=1" ];

  # ── NVIDIA Driver ─────────────────────────────────────────────────────────
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;

    prime = {
      intelBusId  = "PCI:0:2:0";   # ← replace with YOUR Intel bus ID
      nvidiaBusId = "PCI:1:0:0";   # ← replace with YOUR NVIDIA bus ID

      offload = {
        enable = true;
        enableOffloadCmd = true;  # gives you `nvidia-offload <app>` command
      };
    };
  };

  # ── Graphics ──────────────────────────────────────────────────────────────
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # ── Wayland / NVIDIA env vars ─────────────────────────────────────────────
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME         = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    GBM_BACKEND               = "nvidia-drm";
    WLR_NO_HARDWARE_CURSORS   = "1";
    NIXOS_OZONE_WL            = "1";
    MOZ_ENABLE_WAYLAND        = "1";
  };

  # ── XDG portals (screen share, file picker) ───────────────────────────────
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  # ── Audio ─────────────────────────────────────────────────────────────────
  security.rtkit.enable = true;
  services.pipewire = {
    enable            = true;
    alsa.enable       = true;
    alsa.support32Bit = true;
    pulse.enable      = true;
  };

  # ── Display Manager ───────────────────────────────────────────────────────
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
      user    = "greeter";
    };
  };

  # ── Polkit (required by Hyprland) ─────────────────────────────────────────
  security.polkit.enable = true;
  
  #Keyring
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;
 
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
