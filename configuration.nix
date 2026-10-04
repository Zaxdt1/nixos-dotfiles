{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./plasma.nix
    ./niri.nix
    ./gaming.nix
    ./nvidia.nix
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

hardware.bluetooth.enable = true;
hardware.bluetooth.powerOnBoot = true;



  # Bootloader setup for modern UEFI systems.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use the latest available Linux kernel.


  # Networking configuration.
  networking.hostName = "pcmain";
  networking.networkmanager.enable = true;

  # Localization and time settings.
  time.timeZone = "Europe/Belgrade";
  i18n.defaultLocale = "en_US.UTF-8";

  # Graphical user interface (KDE Plasma 6).
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.defaultSession = lib.mkForce "plasma";

  # Keyboard layout.
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Printing services.
  services.printing.enable = true;

  # Audio setup with Pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # User account configuration.
  users.users."zaxdt" = {
    isNormalUser = true;
    description = "zaxdt";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };



  # Global system software.

  nixpkgs.config.allowUnfree = true;
  programs.fish.enable = true;
  environment.sessionVariables.MOZ_ENABLE_WAYLAND = "0";


environment.sessionVariables = {
    HOME_NIX_PROFILE = "$HOME/.nix-profile";
  };


  environment.systemPackages = with pkgs; [
  curl

  ];

  # System services.
  services.openssh.enable = true;

  # State version compatibility.
  system.stateVersion = "26.05";

}
