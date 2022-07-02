{ config, pkgs, ... }:

{
imports = [
./emacs.nix
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
  userEmail = "luis.braun07@gmail.com";
  #init = { defaultBranch = "main"; } ;  
  };
   home.file = {
   ".config/alacritty/alacritty.yml".text = ''
   '';
   };
   home.file = {
   ".bashrc".text = ''
   alias p9="~/9vm/drawterm -h 192.168.122.75 -a 192.168.122.75"
   '';
   };
 
#

}
