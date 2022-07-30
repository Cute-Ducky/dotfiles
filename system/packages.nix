{ pkgs, ... }:

{

environment.systemPackages = with pkgs; [
# wayland
wayland
xwayland
cage

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
fluffychat element-desktop
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
