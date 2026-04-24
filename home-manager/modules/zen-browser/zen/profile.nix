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
    };

    keyboardShortcutsVersion = 17; # pin to detect regressions
    keyboardShortcuts = [
      {
        id = "zen-compact-mode-toggle";
        key = "s";
        modifiers.control = true;
        modifiers.alt = true;
      }
      {
        id = "zen-compact-mode-show-sidebar"; # toggle floating sideboar
        key = "f";
        modifiers.control = true;
        modifiers.alt = true;
      }
      {
        id = "key_savePage";
        key = "s";
        modifiers.control = true;
      }
      {
        id = "key_quitApplication";
        disabled = true;
      }
    ];

    # Optional: Pin to a specific shortcuts version to detect breaking changes
    # Find the current version at about:config -> zen.keyboard.shortcuts.version
    # If Zen Browser updates and changes shortcuts, activation will fail with a clear error
    # keyboardShortcutsVersion = 1;

    spacesForce = true;
    spaces = {
      "Personal" = {
        id = "4d929899-3c7c-44e3-be00-e1e850836b6f";
        icon = "🏡";
        position = 1000;
        theme = {
          type = "gradient";
          colors = [
            {
              algorithm = "floating";
              type = "explicit-lightness";
              red = 107;
              green = 126;
              blue = 148;
              lightness = 50;
              position = {
                x = 51;
                y = 97;
              };
            }
          ];
          opacity = 0.5;
        };
      };
      "Work" = {
        id = "1aa8cdd7-cf7b-4523-a2aa-20d3f085dfd3";
        icon = "🧑‍💻";
        position = 2000;
        theme = {
          type = "gradient";
          colors = [
            {
              algorithm = "floating";
              type = "explicit-lightness";
              red = 84;
              green = 140;
              blue = 171;
              lightness = 50;
              position = {
                x = 68;
                y = 137;
              };
            }
          ];
          opacity = 0.5;
        };
      };

    };

    pinsForce = true;
    pins = {
      "Clockify" = {
        id = "fbe8aca9-6962-45eb-a099-0e7e18e9f25d";
        workspace = spaces."Work".id;
        url = "https://app.clockify.me/tracker";
        isEssential = true;
        position = 0;
      };
      "GCal" = {
        id = "336445e0-1f54-45cb-a83a-83d0d59f4d74";
        workspace = spaces."Work".id;
        url = "https://calendar.google.com";
        isEssential = true;
        position = 1;
      };
      "GMail" = {
        id = "f9ff7a4d-95ab-4179-ba40-4835d0bbe502";
        workspace = spaces."Work".id;
        url = "https://mail.google.com";
        isEssential = true;
        position = 2;
      };
      "GitHub" = {
        id = "f6f117f5-8c5d-42f5-b8db-ded620fc2de2";
        workspace = spaces."Work".id;
        url = "https://github.com/notifications";
        isEssential = true;
        position = 3;
      };
    };

    search = {
      force = true;
      default = "DuckDuckGo";
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

          "DuckDuckGo" = {
            urls = [
              {
                template = "https://duckduckgo.com";
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
