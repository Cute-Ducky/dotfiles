# Edet this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).


{ config, pkgs, ... }:
 
{
imports =
[ # Include the results of the hardware scan.
./hardware-configuration.nix
];

# make ready for flakes
  nix = {
    package = pkgs.nixFlakes; 
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
   };



 nixpkgs.overlays = [
     (final: prev: {
            dwm = prev.dwm.overrideAttrs (old: { src = ./src/dwm ;});
            slock = prev.slock.overrideAttrs (old: {src = ./src/slock ;});
          })
      ];


hardware.enableAllFirmware = true;
nixpkgs.config.allowUnfree = true;

hardware.bluetooth.enable = false;

# Use the systemd-boot EFI boot loader.
# boot.loader.systemd-boot.enable = true;
# boot.loader.efi.canTouchEfiVariables = true;
# 03e1097b-e112-49cf-9cd3-e39e832e29fa
boot = {
   #kernelPackages = pkgs.linuxPackages_latest_hardened;
   loader = {
	efi = {
	   #canTouchEfiVariables = true;
	   efiSysMountPoint = "/boot";
	};
   	grub = {
	   enable = true;
	   devices = [ "nodev" ];
	   efiInstallAsRemovable = true;
	   efiSupport = true;
	   useOSProber = true;
	   extraConfig = ''
	   serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1
	   terminal_input --append serial
	   terminal_output --append serial
	   '';
	   #theme = pkgs.nixos-grub2-theme;
	};
   };
   supportedFilesystems = [ "zfs" ]; #  add bcachefs here
   zfs.requestEncryptionCredentials = true;
   #plymouth = {
	#enable = true;
   #};
};

# disable coredump that could be exploited later
# and also slow down the system when something crash
systemd.coredump.enable = false;

services.zfs = {
autoScrub.enable = true;
#autoSnapshot = {
#	enable = true;
#	#flags = "-k -p --utc";
#	frequent = 32;
#	hourly = 240;
#	monthly = 2;
#};
};
  #services.cron = {
  #  enable = true;
  #  systemCronJobs = [
      #"*/1 * * * *      root    bash -c \"zfs snapshot NIXROOT/home@$(date +'%d.%m.%Y-%H:%M'); echo \"$(date +'%d.%m.%Y-%H:%M') snapshot created\" \" >> /tmp/cron.log"
    #];
  #};
networking.hostId = "5ff65061";

# Upgrades
system.autoUpgrade.enable = true;
system.autoUpgrade.allowReboot = true;
system.autoUpgrade.channel = "https://nixos.org/channels/nixos-unstable/";

networking.hostName = "nixos"; # Define your hostname.
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

networking.networkmanager.enable = true;  
networking.extraHosts = ''
192.168.178.169 pi.home.local
'';

# Set your time zone.
time.timeZone = "Europe/Berlin";
# docker
virtualisation.docker.enable = true;

# The global useDHCP flag is deprecated, therefore explicitly set to false here.
# Per-interface useDHCP will be mandatory in the future, so this generated config
# replicates the default behaviour.
networking.useDHCP = false;

# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

# Select internationalisation properties.
i18n.defaultLocale = "en_US.UTF-8";
console = {
  font = "Lat2-Terminus16";
  keyMap = "us";
};

# NUR

nixpkgs.config.packageOverrides = pkgs: {
  nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
    inherit pkgs;
  };
};


# Enable CUPS to print documents.
# services.printing.enable = true;

# Enable sound.
sound.enable = true;
hardware.pulseaudio.enable = true;


# Define a user account. Don't forget to set a password with ‘passwd’.
users.users.glenda = {
isNormalUser = true;
extraGroups = [ "wheel" "libvirtd" "docker" ]; 
#defaultUserShell = "zsh";
};

# List packages installed in system profile. To search, run:
# $ nix search wget
# packages

environment = {
   shellAliases = {
   nixrebuild = "nixos-rebuild switch";
   };
   variables = {
   PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b ";
   };

systemPackages = with pkgs; [
eww
doas
vim neovim helix
neofetch pfetch
wget
firefox
fluffychat element-desktop
thunderbird mailspring
rpi-imager
xautolock
xlockmore
qbittorrent
qemu_full
go zig tinycc
openssl
php
espeak
cargo
rustup
rustc
vscode
bash zsh fish mksh
bitwarden bitwarden-cli
ansible
jellyfin
brightnessctl slock
dwm dmenu alacritty st
fish
telegram-cli mattermost-desktop session-desktop-appimage tdesktop qtox
drawterm plan9port
virt-manager #quickemu
minecraft lunar-client
git
feh
bitwarden
docker docker-compose
#nur.repos.wolfangaukang.librewolf-bin
librewolf
nerdfonts
busybox
bc
picom
dialog
#libs
#SDL2_image
xorg.libXinerama
];
};
# jellyfin
# systemd.user.services.jellyfin.enable = false;
# virt-manager
virtualisation.libvirtd.enable = true;

# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:

# Enable the OpenSSH daemon.
services.openssh.enable = true;

# Open ports in the firewall.
networking.firewall.allowedTCPPorts = [ 22  8096 ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;
programs = {
   dconf.enable = true;
   zsh = {
  	enable = true;
	syntaxHighlighting = {
	   enable = true;
	   highlighters = [ "main" "brackets" ];
	   styles = {
	   "alias" = "fg=magenta,bold";
	   };
	};
	#ohMyZsh = {
	#   theme = "robbyrussell";
	#   plugins = [ "zsh-interactive-cd" ];
	#};
   };
   # enable firejail
   #firejail.enable = true;
   #firejail.wrappedBinaries = {
   #firefox = {
   #    executable = "${pkgs.lib.getBin pkgs.firefox}/bin/firefox";
   #    profile = "${pkgs.firejail}/etc/firejail/firefox.profile";
   #};
   #};
};
# enable antivirus clamav and
# keep the signatures' database updated
services.clamav.daemon.enable = true;
services.clamav.updater.enable = true;
# Xorg
services.xserver = {
enable = true;
libinput.enable = true;
displayManager = {
	startx.enable = true;
	defaultSession = "dwm";
  #wallpaper
  # sessionCommands = "feh --bg-fill /etc/nixos/src/wallpapers/nixos-nord.png";	
};
windowManager = {
	dwm.enable = true;
	cwm.enable = true;
};
};



# Doas
security.doas.enable = true;
security.sudo.enable = false;
# Configure doas
security.doas.extraRules = [{
users = [ "glenda" ];
keepEnv = true;
persist = true;  
}];


system.stateVersion = "21.11";
}
