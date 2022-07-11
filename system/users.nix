{ ... }:
{
users.users.glenda = {
  isNormalUser = true;
  home  = "/home/glenda";
  description  = "Glenda from outer space";
  extraGroups = [ "wheel" "libvirtd" "docker" ];
  gid = 1000;
};
}
