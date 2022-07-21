{ config, pkgs, ... }:

{
imports = [
../glenda/picom.nix
../glenda/vim.nix
];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "cducky";
  home.homeDirectory = "/home/cducky";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
	bat
	gcc
        ripgrep
  ];
   home.file = {
   ".config/alacritty/alacritty.yml".text = ''
   '';
   ".config/nitrogen/nitrogen.cfg".text = ''
[geometry]
posx=30
posy=35
sizex=1860
sizey=1035

[nitrogen]
view=icon
recurse=true
sort=alpha
icon_caps=false
dirs=/home/cducky/.dotfiles/wallpapers;
   '';
   ".config/nitrogen/bg-saved.cfg".text = ''
[xin_-1]
file=/home/cducky/.dotfiles/wallpapers/lofi-4K.jpg
mode=4
bgcolor=#000000
   '';


   };
}
