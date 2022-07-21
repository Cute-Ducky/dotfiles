{ ... }:
{
users.users.cducky = {
  isNormalUser = true;
  home  = "/home/cducky";
  extraGroups = [ "wheel" "libvirtd" "docker" "audio" ];
 };
}
