 { pkgs, config, ... }: {
        programs.alacritty = {
          enable = true;
          settings = {
            window = {
              dimensions = {
                columns = 115;
                lines = 30;
              };
              padding = { x = 14; y = 14; };
              opacity = 0.92;   # wallpaper still glows through, text stays crisp
            };
            colors = {
              primary = {
                background = "#1e1e2e";  # deep blue-violet — neutral enough for any wallpaper
                foreground = "#cdd6f4";  # soft white, ~11:1 contrast on the background
                dim_foreground = "#a6adc8";
              };
              cursor = {
                text = "#1e1e2e";
                cursor = "#f5e0dc";      # rosewater — visible on both light and dark wallpapers
              };
              selection = {
                background = "#45475a";
                foreground = "#cdd6f4";
              };
              normal = {
                black   = "#45475a";     # deliberately lifted from "true black" so it never disappears
                red     = "#f38ba8";
                green   = "#a6e3a1";
                yellow  = "#f9e2af";
                blue    = "#89b4fa";
                magenta = "#cba6f7";
                cyan    = "#94e2d5";
                white   = "#bac2de";
              };
              bright = {
                black   = "#585b70";
                red     = "#f38ba8";
                green   = "#a6e3a1";
                yellow  = "#f9e2af";
                blue    = "#89b4fa";
                magenta = "#cba6f7";
                cyan    = "#94e2d5";
                white   = "#a6adc8";
              };
            };
          };
        };
      }
