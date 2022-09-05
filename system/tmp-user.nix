{ ... }: 
{
   # this is extremly early in development and propably won't work for a while
users.users.tmp = {
  isNormalUser = true;
  home  = "/home/tmp";
  description  = "temp user, forget everything after reboot. Optimized for security";
  #extraGroups = [ "wheel" ]; # not in wheel to not be able go get root
 # guid is 1002 
};

fileSystems."/home/tmp" = {
  device = "none";
  fsType = "tmpfs";
  options = [ "defaults" "mode=755" "noexec" ];
};
} 

