#Shared by all machines
{ config, pkgs, stateVer, ... }:
{

  home.stateVersion = "23.05";
  
  home.packages = with pkgs; [
    nixpkgs-fmt
   # gnumake
   # autoconf
   # (hiPrio bintools)
    wget
    unzip
    git
  ];
}
