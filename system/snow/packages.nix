{ pkgs, ... }:
{
   environment.systemPackages = with pkgs; [
     vim 
     neovim
     wget
     git
     htop
     gotop
     ranger
     pcmanfm
     fuse3
     vlc
     nsxiv
     gparted
     home-manager
     alacritty
     cava
     cmatrix
     rofi
     dmenu
     picom
     polybar
     nitrogen
     neofetch
     firefox
     tdesktop
     fluffychat
     go-task
   ];

}
