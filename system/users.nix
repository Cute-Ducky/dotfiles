{ ... }:
{
users.users.glenda = {
  isNormalUser = true;
  home  = "/home/glenda";
  description  = "Glenda from outer space";
  extraGroups = [ "wheel" "libvirtd" "docker" "audio" "podman" ];
 };
}
