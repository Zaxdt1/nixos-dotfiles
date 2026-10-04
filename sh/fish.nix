{pkgs, ...}: {

programs.fish = {
enable = true;
interactiveShellInit = ''
  if status --is-interactive
    if not set -q FASTFETCH_HAS_RUN
      set -g FASTFETCH_HAS_RUN 1
      fastfetch --structure-disabled packages:localip:disk:de --detect-version false
    end
  end
'';

shellAliases = {
        update = "nix flake update --flake /home/zaxdt/dotfiles/nixos && sudo nixos-rebuild switch --flake /home/zaxdt/dotfiles/nixos#pcmain";
      };
};
}
