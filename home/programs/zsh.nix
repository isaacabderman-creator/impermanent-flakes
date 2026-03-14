{pkgs, ...}:
{
  programs.zsh = {
	  enable = true;
	  enableCompletion = true;
	  completionInit = "autoload -U compinit && compinit";
	  history = {
		size = 10000;
		path = "$HOME/.config/zsh/history";
	  };
	  plugins = [
	    {
	      name = "powerlevel10k";
	      src = pkgs.zsh-powerlevel10k;
	      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
	    }
	  ];
	  initExtra = ''
	  POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
	  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
	  '';
  };
}
