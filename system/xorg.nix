{ ... }:

{
 nixpkgs.overlays = [
     (final: prev: {
            dwm = prev.dwm.overrideAttrs (old: { 
               src = ./src/dwm;
               });
            tabbed-siduck = prev.tabbed.overrideAttrs (old: {
               src = final.fetchgit {
        url = "https://github.com/siduck/tabbed.git";
        # master on 7/21/2022
        rev = "4e50690";
        sha256="sha256-l63VtMqs/vu6zeoOFCVk1lOKb0zwl2PowU4Jm3Sj6Q4=";
      };
      });
            #slock = prev.slock.overrideAttrs (old: {src = ./src/slock ;});
          })
      ];

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
