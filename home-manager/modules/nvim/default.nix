{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      # LSP серверы
      bash-language-server           # bashls
      vscode-langservers-extracted   # cssls, html, jsonls
      eslint_d                       # eslint
      graphql-language-service-cli   # graphql
      lua-language-server            # lua_ls
      prisma-engines                 # prismals
      tailwindcss-language-server    # tailwindcss
      # typescript-language-server уже включен в typescript-tool

      # additional plugins
      gnumake
    ];

    plugins = with pkgs.vimPlugins; [
      lazy-nvim
    ];

    extraLuaConfig =
      let
        plugins = with pkgs.vimPlugins; [
          alpha-nvim
          blink-copilot
          blink-cmp
          blink-compat
          bufferline-nvim
          comment-nvim
          copilot-lua
          fidget-nvim
          flash-nvim
          friendly-snippets
          galaxyline-nvim
          git-conflict-nvim
          git-worktree-nvim
          hydra-nvim
          lazy-nvim
          luasnip
          marks-nvim
          mini-ai
          mini-align
          multicursors-nvim
          # neovim-session-manager
          noice-nvim
          nui-nvim
          numb-nvim
          nvim-highlight-colors
          nvim-lspconfig
          nvim-navic
          nvim-scissors
          nvim-sops
          nvim-surround
          nvim-tree-lua
          nvim-treesitter
          nvim-treesitter-textobjects
          nvim-treesitter-textsubjects
          nvim-ts-context-commentstring
          nvim-ufo
          nvim-web-devicons
          package-info-nvim
          plenary-nvim
          popup-nvim
          # printer-nvim
          promise-async
          rainbow-delimiters-nvim
          smart-splits-nvim
          snacks-nvim
          # stay-in-place-nvim
          switch-vim
          telescope-fzf-native-nvim
          telescope-nvim
          todo-comments-nvim
          tokyonight-nvim
          # ts-error-translator-nvim
          typescript-tools-nvim
          ultimate-autopair-nvim
          vim-repeat
          vim-rooter
          vim-speeddating
          which-key-nvim
          codecompanion-nvim
          codesnap-nvim
          comment-box-nvim
          conform-nvim
          diffview-nvim
          FixCursorHold-nvim
          # fzf
          fzf-lua
          gitlinker-nvim
          gitsigns-nvim
          indent-blankline-nvim
          markdown-preview-nvim
          neotest
          neotest-jest
          nvim-autopairs
          nvim-bqf
          nvim-coverage
          nvim-dap
          # nvim-dap-repl-highlights
          nvim-dap-ui
          nvim-dap-virtual-text
          nvim-lint
          nvim-lsp-file-operations
          nvim-nio
          nvim-spectre
          nvim-ts-autotag
          octo-nvim
          refactoring-nvim
          render-markdown-nvim
          # tailwind-fold-nvim
          # tailwind-sorter-nvim
          template-string-nvim
          text-case-nvim
          toggleterm-nvim
          treesj
          tsc-nvim
          # tw-values-nvim
          # vim-maximizer
          vim-table-mode
        ];
        mkEntryFromDrv = drv:
          if lib.isDerivation drv then
            { name = "${lib.getName drv}"; path = drv; }
          else
            drv;
        lazyPath = pkgs.linkFarm "lazy-plugins" (builtins.map mkEntryFromDrv plugins);
      in
      ''
        require('config.EcoVim')
        require('utils.globals')
        require('utils.functions')
       
        require('config.options')

        require("lazy").setup("plugins", {
          defaults = { lazy = false },
          -- install = { colorscheme = { "tokyonight" } },
          checker = { enabled = true },
          concurrency = 10,

          dev = {
            -- reuse files from pkgs.vimPlugins.*
            path = "${lazyPath}",
            patterns = { "" },
            -- fallback to download
            fallback = true,
          },


          performance = {
            rtp = {
              disabled_plugins = {
                "gzip",
                "netrwPlugin",
                "tarPlugin",
                "tutor",
                "zipPlugin",
              },
            },
          },
          debug = false,
          ui = {
            border = EcoVim.ui.float.border,
          }
        })

        require('config.keymappings')
        require('config.autocmds')

        require('internal.cursorword')
      '';
  };

  # https://github.com/nvim-treesitter/nvim-treesitter#i-get-query-error-invalid-node-type-at-position
  xdg.configFile."nvim/parser".source =
    let
      parsers = pkgs.symlinkJoin {
        name = "treesitter-parsers";
        paths = (pkgs.vimPlugins.nvim-treesitter.withPlugins (plugins: with plugins; [
          c
          lua
        ])).dependencies;
      };
    in
    "${parsers}/parser";

  # Normal LazyVim config here, see https://github.com/LazyVim/starter/tree/main/lua
  xdg.configFile."nvim/lua".source = ./ecovim/lua;
}
