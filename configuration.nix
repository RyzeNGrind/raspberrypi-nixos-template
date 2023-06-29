{ pkgs, config, lib, ... }:
{
  environment.systemPackages = with pkgs; [ vim git nano];
  services.openssh.enable = true;
  services.tailscale.enable = true;
  networking.hostName = "rtr";
  users = {
    users.myUsername = {
      password = "myPassword";
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };
  networking = {
    interfaces."eth0".useDHCP = false;
    wired = {
      interfaces = [ "eth0" ];
      enable = true;
    };
    /*interfaces."wlan0".useDHCP = true;
    wireless = {
      interfaces = [ "wlan0" ];
      enable = true;
      networks = {
        networkSSID.psk = "password";
      };*/
    };
  };
}
