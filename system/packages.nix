{ pkgs, ... }:

{

environment.systemPackages = with pkgs; [
nushell
shellcheck
python310Packages.youtube-dl
xorg.xkill
alsa-utils
signal-desktop
clamav
efibootmgr
refind
glibc
pango
graphene 
gdk-pixbuf-xlib
oed
gnum4
oed
gtk4
zip
unzip
marktext
direnv
# tty 
fbterm
fbida
kmscon
#nixops
sshfs
python
python3
arion
docker-client
# Haxing
nmap
# wayland
grim
wayland
xwayland
cage
hyprland
waybar
wofi
rofi-wayland
swaybg

slop
davfs2
nixos-generators
arandr
asciinema
gh
borgbackup
cachix
tabbed-siduck
pavucontrol
lazygit
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
element-desktop
thunderbird mailspring
rpi-imager
gotop
xautolock
xlockmore
qbittorrent
qemu_full
openssl
libreoffice-fresh
#php
libimobiledevice
espeak
scrot
gptfdisk
# Programming languages
cargo rustup rustc
go
#gnupg pinentry #broken for some reason FIXME
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
minecraft lunar-client
git
feh
bitwarden
docker docker-compose
#nur.repos.wolfangaukang.librewolf-bin

nerdfonts jetbrains-mono
#busybox
coreutils
uutils-coreutils
shadow
bc
picom
dialog
#libs
#SDL2_image
xorg.libXinerama
];

}
