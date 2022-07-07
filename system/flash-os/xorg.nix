
{ config, pkgs, ... }:

{
services.xserver.desktopManager.pantheon.enable = true;
#services.xserver.displaypManager.lightdm.enable = true;

services.xserver = {
	enable = true;
	displayManager = {
	lightdm = {
		enable = true;
	};
	};
};
}
