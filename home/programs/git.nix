{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "Your Name";
    userEmail = "you@example.com";

    extraConfig = {
      credential.helper = "${pkgs.gitCredentialLibsecret}/bin/git-credential-libsecret";
    };
  };
}
