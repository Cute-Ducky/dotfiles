{ pkgs, ... }:
{
 services.cage = {
  enable = true;
  user = "glenda";
  # Disable color and bold and use a larger font to make OCR easier:
  program = "/home/glenda/9vm/drawterm -h 192.168.122.75 -a 192.168.122.75";
  };

}
