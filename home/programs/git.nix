{ pkgs, ... }: {
  programs.git.settings = {
    enable = true;
    user = {
      name = "isaacabderman-creator";
      mail = "isaacabderman@gmail.com";
    };
    extraConfig = {
      url."git@github.com".insteadOf = "https://github.com/";
    };
  };
}
