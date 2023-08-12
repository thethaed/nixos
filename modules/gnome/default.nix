{ pkgs, ... }:
{
  services.xserver.desktopManager.gnome.enable = true;

  # https://github.com/NixOS/nixpkgs/issues/75867
  programs.ssh.askPassword = pkgs.lib.mkForce "${pkgs.gnome.seahorse.out}/libexec/seahorse/ssh-askpass";

  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.advanced-alttab-window-switcher
   # gnomeExtensions.adwaita-theme-switcher
    gnomeExtensions.gtile
    gnome.gnome-tweaks
    wmctrl
    gnvim
    adwaita-qt
    libsForQt5.qtstyleplugins
  ];
  
  environment.gnome.excludePackages = with pkgs; [
    gnome-photos
    gnome-tour
    gnome.gnome-weather
    gnome.gnome-contacts
    gnome.simple-scan
    gnome.gnome-music
    gnome.gnome-characters
    gnome.gnome-initial-setup
    
  ];

#  qt5 = {
#    enable = true;
#    platformTheme = "gnome";
#    style = "adwaita-dark";
#  };

  services.udev.packages = with pkgs; [ gnome3.gnome-settings-daemon ];
}
