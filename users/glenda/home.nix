{ config, pkgs, ... }:

{
imports = [
./emacs.nix
./picom.nix
./vim.nix
];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "glenda";
  home.homeDirectory = "/home/glenda";

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
  ];
  programs.git = {
  package = pkgs.gitAndTools.gitFull;
  enable = true;
  userName = "9glenda";
  userEmail = "9glenda@nixmail.com";
  #init = { defaultBranch = "main"; } ;  
  };
   home.file = {
   ".config/alacritty/alacritty.yml".text = ''
   '';
   ".bashrc".text = ''
   alias p9="~/9vm/drawterm -h 192.168.122.75 -a 192.168.122.75"
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
dirs=/home/glenda/.dotfiles/wallpapers;
   '';
   ".config/nitrogen/bg-saved.cfg".text = ''
[xin_-1]
file=/home/glenda/.dotfiles/wallpapers/lofi-4K.jpg
mode=4
bgcolor=#000000
   '';


   };
}
