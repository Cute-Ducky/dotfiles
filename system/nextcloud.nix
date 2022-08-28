{ pkgs, ... }:
{

services.nextcloud = {                
  enable = true;                   
  package = pkgs.nextcloud24;
  hostName = "100.72.219.114";
  config.adminpassFile = "${pkgs.writeText "adminpass" "nextcloud_password123"}";
};
}
