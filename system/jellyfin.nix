{ ... }:
{
   services.jellyfin.enable = true;
   services.jellyfin.openFirewall = true;
   services.jellyfin.user = "jellyfin";
users.users.jellyfin = {
  isNormalUser = false;
  description  = "user running the jellyfin service";
 };
}
