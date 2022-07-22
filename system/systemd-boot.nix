{ ... }:
{
   
boot = {
   loader = {
        efi.efiSysMountPoint = "/boot/efi";
        systemd-boot = {
              enable = true;
           }; 
         efi.canTouchEfiVariables = true;
      };
   };
}
