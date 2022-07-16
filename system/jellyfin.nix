{ ... }:
{
users.users.jellyfin = {
  isNormalUser = flase;
  description  = "user running the jellyfin service";
 };
}
   services.jellyfin.enable = true;
   services.jellyfin.openFirewall = ture;
   services.jellyfin.user = ture;
}
