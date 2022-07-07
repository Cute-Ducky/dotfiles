{ config, pkgs, ... }:
{
services.zfs = {
autoScrub.enable = true;
autoSnapshot = {
  enable = true;
  flags = "-k -p";
  frequent = 32;
  hourly = 240;
  monthly = 2;
};
trim.enable = true;
};
networking.hostId = "5ff65061";

boot = {
   supportedFilesystems = [ "zfs" ]; #  add bcachefs here
   zfs.requestEncryptionCredentials = true; # ZFS only
};

}

