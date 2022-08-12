{ ... }:
{
# Doas
security.doas.enable = true;
security.sudo.enable = false;
# Configure doas
security.doas.extraRules = [{
users = [ "glenda" ];
keepEnv = true;
noPass = true;
}];

}

