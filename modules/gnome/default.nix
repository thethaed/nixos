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
    gnome-connections
    gnome.gnome-calendar
    gnome.gnome-weather
    gnome.gnome-contacts
    gnome.gnome-music
    gnome.gnome-characters
    gnome.gnome-initial-setup
    gnome.gnome-maps
    gnome.simple-scan
    gnome.cheese
    gnome.epiphany
    gnome.geary
    gnome.yelp
    gnome.totem
    gnome.baobab
    gnome.eog
    gnome.seahorse
    gnome.file-roller
    gnome.evince
        
  ];

#  qt5 = {
#    enable = true;
#    platformTheme = "gnome";
#    style = "adwaita-dark";x
#  };

  services.udev.packages = with pkgs; [ gnome3.gnome-settings-daemon ];
}
