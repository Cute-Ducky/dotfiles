{ ... }:
{
       fileSystems."/jellyfin" =
    { device = "/dev/disk/by-uuid/e1c01647-d46c-42ad-9e02-152d1a1a2bb7";
      fsType = "ext4";
    };
}
