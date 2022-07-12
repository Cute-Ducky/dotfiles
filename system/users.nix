{ ... }:
{
users.users.glenda = {
  isNormalUser = true;
  home  = "/home/glenda";
  description  = "Glenda from outer space";
  extraGroups = [ "wheel" "libvirtd" "docker" "audio" ];
  #gid = 1000;
  password = "*S#Ffmv$XnFc84fpc&yUEJV83gN!y";
};
}
