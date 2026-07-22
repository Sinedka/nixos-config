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
      cloud = {
        authenticated = false;
        settingsSync = false;
        settingsSyncVersion = 1784711001899;
        url = "https://api.vencord.dev/";
      };
      disableMinSize = false;
      eagerPatches = false;
      enableReactDevtools = true;
      enabledThemes = [
        "system24 (tokyo night)"
        "system24.css"
      ];
      frameless = true;
      notifications = {
        logLimit = 50;
        position = "bottom-right";
        timeout = 5000;
        useNative = "not-focused";
      };
      plugins = {
        AccountPanelServerProfile = {
          enabled = true;
          prioritizeServerProfile = false;
        };
        AlwaysAnimate = {
          enabled = true;
        };
        AlwaysExpandRoles = {
          enabled = true;
        };
        AlwaysTrust = {
          domain = true;
          enabled = true;
          file = true;
        };
        AnonymiseFileNames = {
          enabled = true;
          anonymiseByDefault = true;
          method = 0;
          randomisedLength = 7;
          consistent = "image";
        };
        AppleMusicRichPresence = {
          enabled = false;
        };
        BadgeAPI = {
          enabled = true;
        };
        BetterFolders = {
          closeAllFolders = false;
          closeAllHomeButton = false;
          enabled = true;
          forceOpen = false;
          keepIcons = false;
          showFolderIcon = 1;
          sidebar = true;
          sidebarAnim = true;
          closeOthers = false;
        };
        BetterGifAltText = {
          enabled = false;
        };
        BetterGifPicker = {
          enabled = true;
        };
        BetterNotesBox = {
          enabled = false;
        };
        BetterRoleContext = {
          enabled = false;
        };
        BetterRoleDot = {
          enabled = false;
          bothStyles = false;
          copyRoleColorInProfilePopout = false;
        };
        BetterSessions = {
          enabled = false;
          backgroundCheck = false;
          checkInterval = 20;
        };
        BetterSettings = {
          disableFade = true;
          eagerLoad = true;
          enabled = true;
          organizeMenu = true;
        };
        BetterUploadButton = {
          enabled = true;
        };
        BiggerStreamPreview = {
          enabled = true;
        };
        BlurNSFW = {
          enabled = false;
          blurAmount = 10;
        };
        CallTimer = {
          enabled = true;
        };
        ChatInputButtonAPI = {
          enabled = true;
        };
        ClearURLs = {
          enabled = true;
        };
        ClientTheme = {
          enabled = false;
          color = "313338";
        };
        ColorSighted = {
          enabled = false;
        };
        CommandsAPI = {
          enabled = true;
        };
        ConsoleJanitor = {
          enabled = true;
          disableLoggers = false;
          disableSpotifyLogger = true;
          whitelistedLoggers = "GatewaySocket; Routing/Utils";
          allowLevel = {
            error = true;
            warn = false;
            trace = false;
            log = false;
            info = false;
            debug = false;
          };
        };
        ConsoleShortcuts = {
          enabled = true;
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
          enabled = true;
          hideButton = false;
          replaceElements = 0;
          dearrowByDefault = true;
        };
        Decor = {
          enabled = false;
        };
        DisableCallIdle = {
          enabled = true;
        };
        DisableDeepLinks = {
          enabled = true;
        };
        DontRoundMyTimestamps = {
          enabled = false;
        };
        DynamicImageModalAPI = {
          enabled = false;
        };
        Experiments = {
          enabled = false;
          toolbarDevMenu = false;
        };
        ExpressionCloner = {
          enabled = true;
        };
        F8Break = {
          enabled = false;
        };
        FakeNitro = {
          enableEmojiBypass = true;
          enableStickerBypass = true;
          enableStreamQualityBypass = true;
          enabled = true;
          transformCompoundSentence = false;
          transformEmojis = true;
          transformStickers = true;
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
          originalImagesInChat = false;
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
        IgnoreActivities = {
          enabled = false;
        };
        ImageLink = {
          enabled = false;
        };
        ImageZoom = {
          enabled = true;
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
        LoadingQuotes = {
          enabled = false;
        };
        MemberCount = {
          enabled = true;
          memberList = true;
          toolTip = true;
          voiceActivity = true;
        };
        MemberListDecoratorsAPI = {
          enabled = true;
        };
        MentionAvatars = {
          enabled = false;
        };
        MessageAccessoriesAPI = {
          enabled = true;
        };
        MessageClickActions = {
          enabled = false;
        };
        MessageDecorationsAPI = {
          enabled = true;
        };
        MessageEventsAPI = {
          enabled = true;
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
        MessagePopoverAPI = {
          enabled = true;
        };
        MessageUpdaterAPI = {
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
          enabled = true;
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
        NoTrack = {
          disableAnalytics = true;
          enabled = true;
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
        PictureInPicture = {
          enabled = true;
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
          enabled = true;
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
        SendTimestamps = {
          enabled = false;
        };
        ServerInfo = {
          enabled = false;
        };
        ServerListAPI = {
          enabled = false;
        };
        ServerListIndicators = {
          enabled = false;
        };
        Settings = {
          enabled = true;
          settingsLocation = "aboveNitro";
          includeVencordInfoWhenCopying = true;
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
          hideUnreads = true;
          showMode = 0;
        };
        ShowHiddenThings = {
          enabled = true;
          showInvitesPaused = true;
          showModView = true;
          showTimeouts = true;
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
          enabled = true;
          hoverControls = false;
        };
        SpotifyCrack = {
          enabled = true;
          noSpotifyAutoPause = true;
          keepSpotifyActivityOnIdle = false;
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
        Summaries = {
          enabled = false;
        };
        SuperReactionTweaks = {
          enabled = false;
        };
        SupportHelper = {
          enabled = true;
        };
        TextReplace = {
          enabled = false;
        };
        ThemeAttributes = {
          enabled = false;
        };
        Translate = {
          autoTranslate = false;
          enabled = true;
          showChatBarButton = true;
          service = "google";
          receivedInput = "auto";
          receivedOutput = "ru";
          showAutoTranslateTooltip = true;
          sentInput = "auto";
          sentOutput = "en";
          dismissedAutoTranslateAlert = true;
        };
        TypingIndicator = {
          enabled = false;
        };
        TypingTweaks = {
          enabled = false;
        };
        USRBG = {
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
        UserSettingsAPI = {
          enabled = true;
        };
        UserVoiceShow = {
          enabled = true;
          showInUserProfileModal = true;
          showInMemberList = true;
          showInMessages = true;
        };
        ValidReply = {
          enabled = false;
        };
        ValidUser = {
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
        VoiceChatDoubleClick = {
          enabled = true;
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
        WebContextMenus = {
          enabled = true;
        };
        WebKeybinds = {
          enabled = true;
        };
        "WebRichPresence (arRPC)" = {
          enabled = false;
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
        iLoveSpam = {
          enabled = false;
        };
        oneko = {
          enabled = true;
        };
        petpet = {
          enabled = true;
        };
        CustomCommands = {
          enabled = false;
          tagsList = {
          };
        };
        MusicRichPresence = {
          enabled = false;
        };
        CharacterCounter = {
          enabled = false;
          colorEffects = true;
        };
        CopyStickerLinks = {
          enabled = false;
        };
        ImageFilename = {
          enabled = false;
        };
        MoreQuickReactions = {
          enabled = false;
        };
        NoMiddleClickPaste = {
          enabled = false;
        };
        TenorGifSearch = {
          enabled = false;
        };
        ConcatenatedComponentExtractor = {
          enabled = true;
        };
        ContextMenuAPI = {
          enabled = true;
        };
        NoticesAPI = {
          enabled = true;
        };
      };
      themeLinks = [ ];
      transparent = true;
      useQuickCss = true;
      winCtrlQ = false;
      winNativeTitleBar = false;
      windowsMaterial = "none";
      uiElements = {
        chatBarButtons = {
        };
        messagePopoverButtons = {
        };
      };
    };

    vencord.themes = {
      "system24" = ./themes/system24-tokyo-night.theme.css;
    };
  };
}
