{ pkgs, ... }: {
  # ── CachyOS kernel, tuned for x86-64-v3 (Zen 3) ──
  boot.kernelPackages = pkgs.linuxPackages_cachyos.cachyOverride {
    cachyVars = pkgs.linuxPackages_cachyos.kernel.cachyConfig.cachyVars // {
      "_processor_opt" = "GENERIC_V3";
    };
  };
}
