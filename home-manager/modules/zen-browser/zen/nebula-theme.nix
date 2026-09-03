{user, ...}:
{
  home.file.".config/zen/${user}/chrome/".source = ./chrome;
  home.file.".config/zen/${user}/chrome/".recursive = true;
}
