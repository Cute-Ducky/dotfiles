{ ... }:
{
# Enable sound.
sound.enable = true;
nixpkgs.config.pulseaudio = true;
hardware.pulseaudio.enable = true;
}
