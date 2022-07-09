{ config, pkgs, ... }:

{

environment.systemPackages = with pkgs; [
nitrogen
eww
doas
vim neovim helix
go-task
vscode
neofetch pfetch
wget
firefox librewolf
diskonaut duf
sxiv
act
emacs
fluffychat element-desktop
thunderbird mailspring
rpi-imager
xautolock
xlockmore
qbittorrent
qemu_full
openssl
#php
espeak
# Programming languages
cargo rustup rustc
go
gcc tinycc clang
bash zsh fish mksh
bitwarden bitwarden-cli
ansible
jellyfin
brightnessctl slock
dwm dmenu alacritty st
telegram-cli mattermost-desktop session-desktop-appimage tdesktop qtox
drawterm plan9port
virt-manager quickemu OVMF
#minecraft lunar-client
git
feh
bitwarden
docker docker-compose
#nur.repos.wolfangaukang.librewolf-bin

nerdfonts jetbrains-mono
#busybox
coreutils
shadow
bc
picom
dialog
#libs
#SDL2_image
xorg.libXinerama
];

}
