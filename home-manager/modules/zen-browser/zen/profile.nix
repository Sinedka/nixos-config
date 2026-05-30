{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.zen-browser.profiles.${config.home.username} = rec {
    id = 0; # Profile IDs must be sequential starting from 0
    settings = {
      "zen.workspaces.continue-where-left-off" = true;
      "zen.workspaces.natural-scroll" = true;
      "zen.view.compact.hide-tabbar" = true;
      "zen.view.compact.hide-toolbar" = true;
      "zen.view.compact.animate-sidebar" = true;
      "zen.welcome-screen.seen" = true;
      "zen.urlbar.behavior" = "float";
      "browser.tabs.allow_transparent_browser" = true;
      "zen.widget.linux.transparency" = true;
      "mousebutton.4th.enabled" = false;
      "mousebutton.5th.enabled" = false;
    };

    search = {
      force = true;
      default = "google";
      engines =
        let
          nixSnowflakeIcon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        in
        {
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "channel";
                    value = "unstable";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = nixSnowflakeIcon;
            definedAliases = [ "p" ];
          };

          "Nix Options" = {
            urls = [
              {
                template = "https://search.nixos.org/options";
                params = [
                  {
                    name = "channel";
                    value = "unstable";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = nixSnowflakeIcon;
            definedAliases = [ "o" ];
          };

          "Home Manager Options" = {
            urls = [
              {
                template = "https://home-manager-options.extranix.com/";
                params = [
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                  {
                    name = "release";
                    value = "master";
                  }
                ];
              }
            ];
            icon = nixSnowflakeIcon;
            definedAliases = [ "hm" ];
          };

          "Google Maps" = {
            urls = [
              {
                template = "http://maps.google.com";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = [
              "maps"
              "gmaps"
            ];
          };

          "Googe" = {
            urls = [
              {
                template = "https://google.com";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                  {
                    name = "origin";
                    value = "unknown";
                  }
                ];
              }
            ];
            definedAliases = [
              "duck"
              "ddg"
              "dck"
              "dckk"
            ];
          };

          bing.metaData.hidden = "true";

          "Hoogle" = {
            urls = [
              {
                template = "https://hoogle.haskell.org/";
                params = [
                  {
                    name = "hoogle";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = [ "h" ];
          };
        };
    };
  };
}
