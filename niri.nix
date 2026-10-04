{ pkgs, config, ... }: {
        programs.niri.enable = true;
        programs.dms-shell = {
          enable = true;
          systemd = {
            enable = true;           # auto-starts DMS in your niri session
            restartIfChanged = true; # restart on rebuilds
          };
        };
      }
