{ config, pkgs, ... }:

{

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.john = {
    isNormalUser = true;
    description = "John";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd"];
    packages = with pkgs; [
      firefox
      #gimp
      vmware-horizon-client
      vmware-workstation
      gnupg
    
    ];
  };
  
  programs.steam.enable = true;
  programs._1password-gui.enable = true;
#  programs._1password-gui.gid = 5000;
  programs._1password-gui.polkitPolicyOwners = [ "john" ];

}
