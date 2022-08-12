{ ... }:
{

services.nextcloud = {                
  enable = true;                   
  package = pkgs.nextcloud24;
  hostName = "localhost";
  config.adminpassFile = "${pkgs.writeText "adminpass" "test123"}";
};
}
