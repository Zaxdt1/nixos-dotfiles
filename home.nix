{ pkgs, ... }: {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "zaxdt";
  home.homeDirectory = "/home/zaxdt";

  imports = [ ./spicetify.nix
              ./sh/fish.nix
              ./terminal/alacritty.nix
  ];


  # This value determines the Home Manager release that your configuration is
  # compatible with. Match this to your system stateVersion or leave at default.
  home.stateVersion = "26.05";







  home.packages = [
    pkgs.htop
    pkgs.wget
    pkgs.vesktop
    pkgs.git
    pkgs.vim
    pkgs.alacritty
    pkgs.fastfetch
    pkgs.zed-editor
    pkgs.nil
    pkgs.fuzzel
    pkgs.waypaper
    pkgs.awww
    pkgs.android-tools
    pkgs.universal-android-debloater
    pkgs.btop
    pkgs.flatpak
    pkgs.heroic
    pkgs.motrix
    pkgs.xwayland-satellite
    pkgs.firefox-bin
    pkgs.unrar
    pkgs.prismlauncher
    pkgs.appimage-run
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
