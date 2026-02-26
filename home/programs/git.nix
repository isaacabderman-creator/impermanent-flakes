{ pkgs, ... }: {
  programs.git.settings = {
    enable = true;
    user = {
      name = "isaacabderman-creator";
      mail = "isaacabderman@gmail.com";
    };
    extraConfig = {
      credential.helper = "store";
    };
  };
}
