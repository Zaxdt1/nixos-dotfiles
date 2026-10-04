{ config, pkgs, ... }:

{
  # ── Graphics stack (32-bit needed for Steam / Proton) ──
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  # ── NVIDIA GTX 1660 Super (Turing) ──
  hardware.nvidia = {
    package = pkgs.nvidia_cachyos;   # driver build from chaotic-nyx
    modesetting.enable = true;
    powerManagement.enable = true;
    open = true;
    nvidiaSettings = true;
  };
}
