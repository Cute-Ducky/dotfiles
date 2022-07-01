
{ config, pkgs, ... }:

{

# Xorg
services.xserver = {
enable = true;
libinput.enable = true;
displayManager = {
        startx.enable = true;
        #defaultSession = "dwm";
  #wallpaper
  # sessionCommands = "feh --bg-fill /etc/nixos/src/wallpapers/nixos-nord.png";
};
windowManager = {
        dwm.enable = true;
        cwm.enable = true;
};
};
}
