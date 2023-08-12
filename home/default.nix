#Shared by all machines
{ config, pkgs, ... }:
{
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
