{ config, pkgs, ... }:

{

environment.systemPackages = with pkgs; [
filezilla
teams
vscode
obs-studio
discord
go-task
vim neovim helix
vscode
neofetch pfetch
google-chrome
firefox 
rpi-imager
cargo rustup rustc
go
tinycc 
bash zsh fish mksh
virt-manager quickemu OVMF
minecraft lunar-client
git
nerdfonts jetbrains-mono
#busybox
coreutils
shadow
flameshot
];

}
