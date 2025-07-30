{ unstable, ... }: 
{
  home.packages = with unstable; [
    (quickshell.overrideAttrs (oldAttrs: {
      buildInputs = oldAttrs.buildInputs ++ [ 
        qt6.qt5compat
        upower
      ];

      nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [ cmake ];
    }))
  ];
    xdg.configFile."quickshell".source = ./quickshell;
}
