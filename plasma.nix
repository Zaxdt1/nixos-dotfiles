{pkgs, config, ...}:
let

  wallpaper = ./assets/a_sculpture_of_a_man_with_a_face_on_his_head.png;
  lockscreenWallpaper = (pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
    [General]
    background=${wallpaper}
    type=image
  '');
in
{
  environment.systemPackages = [ lockscreenWallpaper ];
}



