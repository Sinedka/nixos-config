{
  programs.vesktop = {
    enable = true;
    settings = {
      discordBranch = "stable";
      minimizeToTray = true;
      arRPC = true;
      splashColor = "rgb(201, 201, 201)";
      splashBackground = "rgba(0, 0, 0, 0)";
      enableSplashScreen = true;
      splashTheming = true;
    };

    vencord.settings = {
      autoUpdate = true;
      autoUpdateNotification = true;
      useQuickCss = true;
      themeLinks = [];
      eagerPatches = false;
      enabledThemes = [
          "test1.css"
          "my.css"
      ];
      enableReactDevtools = true;
      frameless = true;
      transparent = true;
      winCtrlQ = false;
      disableMinSize = false;
      winNativeTitleBar = false;
      plugins = {
          ChatInputButtonAPI = {
              enabled = true;
          };
          CommandsAPI = {
              enabled = true;
          };
          DynamicImageModalAPI = {
              enabled = false;
          };
          MemberListDecoratorsAPI = {
              enabled = false;
          };
          MessageAccessoriesAPI = {
              enabled = true;
          };
          MessageDecorationsAPI = {
              enabled = false;
          };
          MessageEventsAPI = {
              enabled = true;
          };
          MessagePopoverAPI = {
              enabled = true;
          };
          MessageUpdaterAPI = {
              enabled = false;
          };
          ServerListAPI = {
              enabled = false;
          };
          UserSettingsAPI = {
              enabled = true;
          };
          AccountPanelServerProfile = {
              enabled = false;
          };
          AlwaysAnimate = {
              enabled = false;
          };
          AlwaysExpandRoles = {
              enabled = false;
          };
          AlwaysTrust = {
              enabled = true;
              domain = true;
              file = true;
          };
          AnonymiseFileNames = {
              enabled = false;
          };
          AppleMusicRichPresence = {
              enabled = false;
          };
          "WebRichPresence (arRPC)" = {
              enabled = false;
          };
          BetterFolders = {
              enabled = true;
              sidebar = true;
              showFolderIcon = 1;
              keepIcons = false;
              closeAllHomeButton = false;
              closeAllFolders = false;
              forceOpen = false;
              sidebarAnim = true;
          };
          BetterGifAltText = {
              enabled = false;
          };
          BetterGifPicker = {
              enabled = false;
          };
          BetterNotesBox = {
              enabled = false;
          };
          BetterRoleContext = {
              enabled = false;
          };
          BetterRoleDot = {
              enabled = false;
          };
          BetterSessions = {
              enabled = false;
          };
          BetterSettings = {
              enabled = true;
              disableFade = true;
              eagerLoad = true;
          };
          BetterUploadButton = {
              enabled = false;
          };
          BiggerStreamPreview = {
              enabled = true;
          };
          BlurNSFW = {
              enabled = false;
          };
          CallTimer = {
              enabled = true;
          };
          ClearURLs = {
              enabled = true;
          };
          ClientTheme = {
              enabled = false;
          };
          ColorSighted = {
              enabled = false;
          };
          ConsoleJanitor = {
              enabled = false;
          };
          ConsoleShortcuts = {
              enabled = false;
          };
          CopyEmojiMarkdown = {
              enabled = false;
          };
          CopyFileContents = {
              enabled = false;
          };
          CopyUserURLs = {
              enabled = false;
          };
          CrashHandler = {
              enabled = true;
          };
          CtrlEnterSend = {
              enabled = false;
          };
          CustomIdle = {
              enabled = false;
          };
          CustomRPC = {
              enabled = false;
          };
          Dearrow = {
              enabled = false;
          };
          Decor = {
              enabled = false;
          };
          DisableCallIdle = {
              enabled = false;
          };
          DontRoundMyTimestamps = {
              enabled = false;
          };
          Experiments = {
              enabled = false;
          };
          ExpressionCloner = {
              enabled = false;
          };
          F8Break = {
              enabled = false;
          };
          FakeNitro = {
              enabled = true;
              enableStickerBypass = true;
              enableStreamQualityBypass = true;
              enableEmojiBypass = true;
              transformEmojis = true;
              transformStickers = true;
              transformCompoundSentence = false;
          };
          FakeProfileThemes = {
              enabled = false;
          };
          FavoriteEmojiFirst = {
              enabled = false;
          };
          FavoriteGifSearch = {
              enabled = false;
          };
          FixCodeblockGap = {
              enabled = false;
          };
          FixImagesQuality = {
              enabled = false;
          };
          FixSpotifyEmbeds = {
              enabled = false;
          };
          FixYoutubeEmbeds = {
              enabled = false;
          };
          ForceOwnerCrown = {
              enabled = false;
          };
          FriendInvites = {
              enabled = false;
          };
          FriendsSince = {
              enabled = false;
          };
          FullSearchContext = {
              enabled = false;
          };
          FullUserInChatbox = {
              enabled = false;
          };
          GameActivityToggle = {
              enabled = false;
          };
          GifPaste = {
              enabled = false;
          };
          GreetStickerPicker = {
              enabled = false;
          };
          HideMedia = {
              enabled = false;
          };
          iLoveSpam = {
              enabled = false;
          };
          IgnoreActivities = {
              enabled = false;
          };
          ImageLink = {
              enabled = false;
          };
          ImageZoom = {
              enabled = false;
          };
          ImplicitRelationships = {
              enabled = false;
          };
          InvisibleChat = {
              enabled = false;
          };
          IrcColors = {
              enabled = false;
          };
          KeepCurrentChannel = {
              enabled = false;
          };
          LastFMRichPresence = {
              enabled = false;
          };
          LoadingQuotes = {
              enabled = false;
          };
          MemberCount = {
              enabled = true;
              memberList = true;
              toolTip = true;
          };
          MentionAvatars = {
              enabled = false;
          };
          MessageClickActions = {
              enabled = false;
          };
          MessageLatency = {
              enabled = false;
          };
          MessageLinkEmbeds = {
              enabled = false;
          };
          MessageLogger = {
              enabled = false;
          };
          MessageTags = {
              enabled = false;
          };
          MutualGroupDMs = {
              enabled = false;
          };
          NewGuildSettings = {
              enabled = false;
          };
          NoBlockedMessages = {
              enabled = false;
          };
          NoDevtoolsWarning = {
              enabled = false;
          };
          NoF1 = {
              enabled = false;
          };
          NoMaskedUrlPaste = {
              enabled = false;
          };
          NoMosaic = {
              enabled = false;
          };
          NoOnboardingDelay = {
              enabled = false;
          };
          NoPendingCount = {
              enabled = false;
          };
          NoProfileThemes = {
              enabled = false;
          };
          NoReplyMention = {
              enabled = false;
          };
          NoServerEmojis = {
              enabled = false;
          };
          NoTypingAnimation = {
              enabled = false;
          };
          NoUnblockToJump = {
              enabled = false;
          };
          NormalizeMessageLinks = {
              enabled = false;
          };
          NotificationVolume = {
              enabled = false;
          };
          OnePingPerDM = {
              enabled = false;
          };
          oneko = {
              enabled = false;
          };
          OpenInApp = {
              enabled = false;
          };
          OverrideForumDefaults = {
              enabled = false;
          };
          PauseInvitesForever = {
              enabled = false;
          };
          PermissionFreeWill = {
              enabled = false;
          };
          PermissionsViewer = {
              enabled = false;
          };
          petpet = {
              enabled = false;
          };
          PictureInPicture = {
              enabled = false;
          };
          PinDMs = {
              enabled = false;
          };
          PlainFolderIcon = {
              enabled = false;
          };
          PlatformIndicators = {
              enabled = false;
          };
          PreviewMessage = {
              enabled = false;
          };
          QuickMention = {
              enabled = false;
          };
          QuickReply = {
              enabled = false;
          };
          ReactErrorDecoder = {
              enabled = false;
          };
          ReadAllNotificationsButton = {
              enabled = false;
          };
          RelationshipNotifier = {
              enabled = false;
          };
          ReplaceGoogleSearch = {
              enabled = false;
          };
          ReplyTimestamp = {
              enabled = false;
          };
          RevealAllSpoilers = {
              enabled = false;
          };
          ReverseImageSearch = {
              enabled = false;
          };
          ReviewDB = {
              enabled = false;
          };
          RoleColorEverywhere = {
              enabled = false;
          };
          SecretRingToneEnabler = {
              enabled = false;
          };
          Summaries = {
              enabled = false;
          };
          SendTimestamps = {
              enabled = false;
          };
          ServerInfo = {
              enabled = false;
          };
          ServerListIndicators = {
              enabled = false;
          };
          ShikiCodeblocks = {
              enabled = false;
          };
          ShowAllMessageButtons = {
              enabled = false;
          };
          ShowConnections = {
              enabled = false;
          };
          ShowHiddenChannels = {
              enabled = true;
              showMode = 0;
              hideUnreads = true;
          };
          ShowHiddenThings = {
              enabled = true;
              showTimeouts = true;
              showInvitesPaused = true;
              showModView = true;
          };
          ShowMeYourName = {
              enabled = false;
          };
          ShowTimeoutDuration = {
              enabled = false;
          };
          SilentMessageToggle = {
              enabled = false;
          };
          SilentTyping = {
              enabled = false;
          };
          SortFriendRequests = {
              enabled = false;
          };
          SpotifyControls = {
              enabled = false;
          };
          SpotifyCrack = {
              enabled = false;
          };
          SpotifyShareCommands = {
              enabled = false;
          };
          StartupTimings = {
              enabled = false;
          };
          StickerPaste = {
              enabled = false;
          };
          StreamerModeOnStream = {
              enabled = false;
          };
          SuperReactionTweaks = {
              enabled = false;
          };
          TextReplace = {
              enabled = false;
          };
          ThemeAttributes = {
              enabled = false;
          };
          Translate = {
              enabled = true;
              autoTranslate = false;
              showChatBarButton = true;
          };
          TypingIndicator = {
              enabled = false;
          };
          TypingTweaks = {
              enabled = false;
          };
          Unindent = {
              enabled = false;
          };
          UnlockedAvatarZoom = {
              enabled = false;
          };
          UnsuppressEmbeds = {
              enabled = false;
          };
          UserMessagesPronouns = {
              enabled = false;
          };
          UserVoiceShow = {
              enabled = false;
          };
          USRBG = {
              enabled = false;
          };
          ValidReply = {
              enabled = false;
          };
          ValidUser = {
              enabled = false;
          };
          VoiceChatDoubleClick = {
              enabled = false;
          };
          VcNarrator = {
              enabled = false;
          };
          VencordToolbox = {
              enabled = false;
          };
          ViewIcons = {
              enabled = false;
          };
          ViewRaw = {
              enabled = false;
          };
          VoiceDownload = {
              enabled = false;
          };
          VoiceMessages = {
              enabled = false;
          };
          VolumeBooster = {
              enabled = false;
          };
          WebKeybinds = {
              enabled = true;
          };
          WebScreenShareFixes = {
              enabled = true;
          };
          WhoReacted = {
              enabled = false;
          };
          XSOverlay = {
              enabled = false;
          };
          YoutubeAdblock = {
              enabled = true;
          };
          BadgeAPI = {
              enabled = true;
          };
          NoTrack = {
              enabled = true;
              disableAnalytics = true;
          };
          Settings = {
              enabled = true;
              settingsLocation = "aboveNitro";
          };
          DisableDeepLinks = {
              enabled = true;
          };
          SupportHelper = {
              enabled = true;
          };
          WebContextMenus = {
              enabled = true;
          };
      };
      notifications = {
          timeout = 5000;
          position = "bottom-right";
          useNative = "not-focused";
          logLimit = 50;
      };
      cloud = {
          authenticated = false;
          url = "https://api.vencord.dev/";
          settingsSync = false;
          settingsSyncVersion = 1752030485950;
      };
    };

    vencord.themes = {
      "test1" = ./themes/test1.css;
      "my" = ./themes/my.css;
    };
  };
}
