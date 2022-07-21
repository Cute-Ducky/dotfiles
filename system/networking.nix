{ ... }:
 
{
networking.hostName = "nixos"; # Define your hostname.
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

networking.networkmanager.enable = true;  
networking.extraHosts = ''
192.168.178.169 pi.home.local
'';
}
