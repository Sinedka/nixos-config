{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    
    # Включить Oh My Zsh
    oh-my-zsh = {
      enable = true;
      
      # Тема (можно выбрать любую из доступных)
      theme = "robbyrussell";  # или "agnoster", "powerlevel10k/powerlevel10k", "spaceship"
      
      # Плагины Oh My Zsh
      plugins = [
        "git"
        "sudo"
        "systemd"
        "history"
        "colored-man-pages"
        "command-not-found"
        "dirhistory"
        "fzf"
      ];
      
      # Дополнительные настройки OMZ
      extraConfig = ''
        # Настройки для плагина history
        HIST_STAMPS="yyyy-mm-dd"
        
        # Настройки для плагина git
        ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}✗"
        ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✓"
        
        # Отключить автоматическое обновление OMZ (управляется через home-manager)
        DISABLE_AUTO_UPDATE="true"
        DISABLE_UPDATE_PROMPT="true"
      '';
    };
    
    # Включить автодополнение и подсветку синтаксиса
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    # История команд
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
      ignoreDups = true;
      share = true;
      extended = true;
    };
    
    # Алиасы
    shellAliases = {
      # Основные
      ll = "eza -la --icons";
      la = "eza -la --icons";
      l = "eza -l --icons";
      ls = "eza --icons";
      tree = "eza --tree --icons";
      cat = "bat";
      grep = "rg";
      find = "fd";
      c = "clear";
      
      # Навигация
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      
      # NixOS специфичные
      rebuild = "sudo nixos-rebuild switch";
      hm-switch = "home-manager switch";
      hm-edit = "$EDITOR ~/.config/home-manager/home.nix";
      nix-search = "nix search nixpkgs";
      nix-shell = "nix-shell --run zsh";
      
      # Git алиасы (дополнительно к OMZ git plugin)
      gst = "git status";
      gaa = "git add --all";
      gcmsg = "git commit -m";
      gp = "git push";
      gpl = "git pull";
      glo = "git log --oneline";
      glog = "git log --oneline --graph --all";
      
      # Hyprland специфичные
      hypr-reload = "hyprctl reload";
    };
    
    # Переменные окружения
    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "firefox";
      TERMINAL = "kitty";
      PAGER = "bat";
      MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    };

    # Дополнительные настройки
    # initExtra = ''
    #   # Настройки для автодополнения
    #   zstyle ':completion:*' menu select
    #   zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
    #   zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
    #   zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
    #   zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
    #   
    #   # Привязки клавиш
    #   bindkey "^[[1;5C" forward-word
    #   bindkey "^[[1;5D" backward-word
    #   bindkey "^[[3~" delete-char
    #   bindkey "^[[H" beginning-of-line
    #   bindkey "^[[F" end-of-line
    #   bindkey "^R" history-incremental-search-backward
    #   
    #   # Функции
    #   function mkcd() {
    #     mkdir -p "$1" && cd "$1"
    #   }
    #   
    #   function extract() {
    #     if [ -f $1 ] ; then
    #       case $1 in
    #         *.tar.bz2)   tar xjf $1     ;;
    #         *.tar.gz)    tar xzf $1     ;;
    #         *.bz2)       bunzip2 $1     ;;
    #         *.rar)       unrar e $1     ;;
    #         *.gz)        gunzip $1      ;;
    #         *.tar)       tar xf $1      ;;
    #         *.tbz2)      tar xjf $1     ;;
    #         *.tgz)       tar xzf $1     ;;
    #         *.zip)       unzip $1       ;;
    #         *.Z)         uncompress $1  ;;
    #         *.7z)        7z x $1        ;;
    #         *)     echo "'$1' cannot be extracted via extract()" ;;
    #       esac
    #     else
    #       echo "'$1' is not a valid file"
    #     fi
    #   }
    #   
    #   # Функция для быстрого поиска и перехода в директорию
    #   function fcd() {
    #     local dir
    #     dir=$(find . -type d -not -path '*/.*' 2>/dev/null | fzf) && cd "$dir"
    #   }
    #   
    #   # Настройки для Hyprland/Wayland
    #   if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    #     export MOZ_ENABLE_WAYLAND=1
    #     export QT_QPA_PLATFORM=wayland
    #     export XDG_CURRENT_DESKTOP=Hyprland
    #     export XDG_SESSION_DESKTOP=Hyprland
    #     export WLR_NO_HARDWARE_CURSORS=1
    #   fi
    #   
    #   # Настройки для direnv (если используется)
    #   if command -v direnv &> /dev/null; then
    #     eval "$(direnv hook zsh)"
    #   fi
    #   
    #   # Настройки для zoxide (если используется)
    #   if command -v zoxide &> /dev/null; then
    #     eval "$(zoxide init zsh)"
    #   fi
    # '';
    
    # Дополнительные плагины (не из OMZ)
    plugins = [
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.7.1";
          sha256 = "03r6hpb5fy4yaakqm3lbf4xcvd408r44jgpv4lnzl9asp4sb9qc0";
        };
      }
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.0";
          sha256 = "1g3pij5qn2j7v7jjac2a63lxd97mcsgw6xq6k5p7835q9fjiid98";
        };
      }
    ];
  };
  
  # Дополнительные пакеты
  home.packages = with pkgs; [
    # Современные альтернативы классическим утилитам
    eza          # замена ls с иконками
    bat          # замена cat с подсветкой
    fd           # замена find
    ripgrep      # замена grep
    fzf          # fuzzy finder
    tree         # для просмотра структуры папок
    btop         # красивый системный монитор
    zoxide       # умный cd
    
    # Для работы с git
    git
    gh           # GitHub CLI
    delta
  ];
  
  # Настройка fzf
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = "fd --type f --hidden --follow --exclude .git";
    defaultOptions = [
      "--height 40%"
      "--layout=reverse"
      "--border"
      "--inline-info"
      "--preview 'bat --color=always --style=header,grid --line-range :300 {}'"
    ];
    historyWidgetOptions = [
      "--sort"
      "--exact"
    ];
  };
  # Настройка bat
  programs.bat = {
    enable = true;
    config = {
      theme = "TwoDark";
      pager = "less -FR";
    };
  };
}
