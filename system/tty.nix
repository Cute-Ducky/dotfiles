{ options,pkgs,config, ... }:
{
   config = {
      services.gpm = {
         enable = true;
      };
      services.kmscon = {
         enable = false;
      };
   };
}

