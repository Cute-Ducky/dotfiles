{ ... }:
 
{
# networking.wireless = {
# enable = true;  # Enables wireless support via wpa_supplicant.
# userControlled.enable = true;
# environmentFile = "/run/secrets/wireless.env";
# networks = {
# home.psk = "@PSK_HOME@";
# work.auth = '''
# eap=PEAP
# identity="my-user@example.com"
# password="@PASS_WORK@"
# ''';
# };
# };

networking.networkmanager.enable = true;  

networking.extraHosts = ''
192.168.178.169 pi.home.local
'';
}
