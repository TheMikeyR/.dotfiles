# Path to your oh-my-zsh installation.
export ZSH=/home/mikeyr/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="flazz"
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"
#LS_COLORS="ow=01;94:di=01;94:ln=01;95"
#export LS_COLORS

export LS_COLORS="ow=01;94:di=01;94:ln=01;95"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
autoload -Uz compinit
compinit

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git completion command-not-found extract history sublime pip)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/mikeyr/git/imgur-screenshot"
export PATH="/home/mikeyr/anaconda2/bin:$PATH"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64"
export CUDA_HOME=/usr/local/cuda


# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Remove username in terminal
DEFAULT_USER="mikeyr"

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    if (($fancy_ctrl_z_already_bg)); then
      disown
    else
      bg
      fancy_ctrl_z_already_bg=1
    fi
    zle redisplay
  else
    zle push-input
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
fancy_ctrl_z_precmd () {
  fancy_ctrl_z_already_bg=0
}
precmd_functions+=fancy_ctrl_z_precmd

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias p6='cd /home/mikeyr/Dropbox/AAU/P6'
alias p6svn='cd /home/mikeyr/Dropbox/AAU/P6_SVN'
alias maple='/home/mikeyr/maple18/bin/xmaple'
alias open='xdg-open'
alias imgur='imgur-screenshot.sh'
alias vgis7='cd /home/mikeyr/Dropbox/AAU/VGIS7'
alias vgis7git='cd /home/mikeyr/Dropbox/AAU/VGIS7-git'
alias opencv='/home/mikeyr/.scripts/opencv.sh'
#alias lock='/home/mikeyr/.xlock/lock.sh'
alias spotifycmd='/home/mikeyr/.scripts/sconsify.sh -preferred-bitrate=320k'
alias vgis8='cd /home/mikeyr/Dropbox/AAU/VGIS8'
alias vgis8git='cd /home/mikeyr/Dropbox/AAU/VGIS8_git'
alias work='cd /home/mikeyr/Dropbox/Arbejde/WCN/smart_city'
alias wpswap='python /home/mikeyr/.scripts/wpswap.py'
#alias keylight='sudo bash /home/mikeyr/.msi-klm/msi-keyboard-CLI/msi-keyboard-CLI.js'
#alias keylightoff='keylight -k off -l on'
# added by Anaconda2 2.5.0 installer
eval $(thefuck --alias)
alias rscp='rsync -aP'
alias rsmv='rsync -aP --remove-source-files'