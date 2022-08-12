{
   networks.npm.external = true; 
  services.vaultwarden = {
    service.image = "vaultwarden/server:latest";
    service.volumes = [ "${toString ./.}/vw-data:/data/" ];
    # /vw-data/:/data/
    service.environment.WEBSOCKET_ENABLED = "true"; # Enable WebSocket notifications.
    service.ports = [
      "80:80" # host:container
    ];
   service.networks = [ "c258ca488ebc" ]; 

  };
  #services.nginx-proxy-manager = {
    #service.image = "jc21/nginx-proxy-manager:latest";
    #service.ports = [
      #"80:80" # 
      # "81:81" # Admin Web Port
      # "443:443"
 #   ];
#      service.environment.DB_MYSQL_HOST = "db";
  #    service.environment.DB_MYSQL_PORT = 3306;
   #   service.environment.DB_MYSQL_USER = "npm";
    #  service.environment.DB_MYSQL_PASSWORD = "npm";
     # service.environment.DB_MYSQL_NAME = "npm";
  # service.networks = [ "c258ca488ebc" ];
   # };
   # services.db = {
      # service.image = "jc21/mariadb-aria:latest";
      # service.environment.MYSQL_ROOT_PASSWORD = "npm";
      # service.environment.MYSQL_DATABASE = "npm";
      # service.environment.MYSQL_USER = "npm";
      # service.environment.MYSQL_PASSWORD = "npm";
   # service.networks = [ "c258ca488ebc" ];
      # };
}
