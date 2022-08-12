{
  services.vaultwarden = {
    service.image = "vaultwarden/server:latest";
    service.volumes = [ "${toString ./.}/vw-data:/data/" ];
    # /vw-data/:/data/
    service.environment.WEBSOCKET_ENABLED = "true"; # Enable WebSocket notifications.
    service.ports = [
      "80:80" # host:container
    ];
    #service.networks = [ "npm" ];

  };
}
