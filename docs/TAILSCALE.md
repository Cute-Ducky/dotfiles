# Tailscale
Tailscale is a mesh VPN using WireGuard. A setup with all devices using Tailscale is recommended for this config. 
## Device List 
| Name  | Description  | Config |
|--------|-|-|
| nixos | main laptop | nixconf |
| Server | Homeserver   | server |
| phone | main phone  | none |
## Security 
One of the main selling points of Tailscale is the is the access control list Tailscale provides which can be used as an alternative to a network firewall. For this usecase a local firewall should be set up on every device to block all incoming connections. All of your connections should be routed through Tailscale and therefore won't be effected by the local firewall. Connections routed through Tailscale are effected by your access control list. 
