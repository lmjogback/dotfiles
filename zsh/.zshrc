# Path to your oh-my-zsh installation.
export ZSH=$HOME/.zsh/oh-my-zsh

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.zsh/custom

# ZSH Cache directory
ZSH_CACHE_DIR=$HOME/.zsh/cache

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="lm"
#ZSH_THEME="afowler"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"
if [[ -z $TMUX ]] DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git gitfast history sudo colored-man-pages zsh_reload tmux-pane-words vi-mode-indicator)

# User configuration
if [[ $USER == "root" ]] {
	export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
	export MANPATH="/usr/local/man:$MANPATH"
}

if [[ $USER == "lm" ]] {
	export PATH="/home/lm/google-cloud-sdk/bin:/home/lm/gocode/bin:/home/lm/bin:/home/lm/.tmuxifier/bin:/usr/local/bin:/usr/bin:/bin:/usr/games"
	export MANPATH="/usr/local/man:$MANPATH"

	# load keychain to manage SSH keys
	if command -v keychain &>/dev/null; then
		eval $(keychain --eval --nogui --quiet --agents ssh id_rsa id_ed25519 github_ed25519)
	fi
}

source $ZSH/oh-my-zsh.sh

set apt_pref='apt-get'

export LESS="-aMRiFqX"
export LESSOPEN="| /usr/bin/lesspipe %s";
export LESSCLOSE="/usr/bin/lesspipe %s %s";

export XAUTHORITY=$HOME/.Xauthority

setopt extended_glob

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gam="/home/lm/bin/gam/gam"

# ZMV
autoload -U zmv
alias zmw='noglob zmv -W'
alias zcp='noglob zmv -C'

# aliases
alias ducks='du -chs * | sort -h'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
