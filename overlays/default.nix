{ unstable }:
self: super: {
  gnomeExtensions = super.gnomeExtensions // {
    adwaita-theme-switcher = super.callPackage ../pkgs/adwaita-theme-switcher.nix { };
    advanced-alttab-window-switcher = super.callPackage ../pkgs/advanced-alt-tab.nix { };
  };
  signal-desktop = super.signal-desktop.overrideAttrs (old: rec {
    version = "5.61.0";
    src = super.fetchurl {
      url = "https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop/signal-desktop_${version}_amd64.deb";
      sha256 = "sha256-1EPOuvul/Dh/gFwgCy7Wme6GYIP1Mi3TofTrIF3kU3g=";
    };
  });
}
