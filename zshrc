# Path to your oh-my-zsh installation.
export ZSH=/home/jtanderson/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="steeef"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
plugins=(git zsh-syntax-highlighting)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/usr/local/go/bin:/usr/texbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
#  export EDITOR='vim'
#else
#  export EDITOR='mvim'
#fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#. /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

if [ -d /usr/local/texlive/2016/bin/x86_64-darwin ]; then
  PATH=$PATH:/usr/local/texlive/2016/bin/x86_64-darwin
fi

if [ -d /usr/local/texlive/2017/bin/x86_64-darwin ]; then
  PATH=$PATH:/usr/local/texlive/2017/bin/x86_64-darwin
fi

if [ -d /usr/local/sbin ]; then
  PATH=$PATH:/usr/local/sbin
fi

if [ -d /usr/local/lib/pkgconfig ]; then
 PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
fi

if [ -d /usr/local/lib ]; then
 PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib
fi

if [ -d ~/.rbenv ]; then
 PATH=$HOME/.rbenv/shims:$PATH
fi

if [ -d ~/anaconda ]; then
 PATH=~/anaconda/bin:$PATH
fi

if [ -d ~/Documents/Dev/go ]; then
  GOPATH=~/Documents/Dev/go
  PATH=$PATH:$GOPATH/bin
fi

if [ -d ~/.homebrew ]; then
  PATH=$PATH:~/.homebrew/bin
fi

if [ -d ~/.dotfiles/scripts ]; then
  PATH=$PATH:~/.dotfiles/scripts
fi

if [ -d /snap/bin ]; then
  PATH=$PATH:/snap/bin
fi

export PATH
export PKG_CONFIG_PATH
export GOPATH

alias csetunnel="sshuttle -r andejose@stdlinux.cse.ohio-state.edu --python /home/8/andejose/.linuxbrew/bin/python 0.0.0.0/0"
alias grade="g++ -std=c++11 -Wall -o grademe"

alias proj3="$HOME/Dropbox/Documents/Academic/Teaching/Salisbury/COSC-220/projects/project3/SULibTests/grade.sh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("/home/$USER/anaconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/$USER/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/$USER/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/$USER/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

man() {
    env \
    LESS_TERMCAP_mb="$(printf "\e[1;31m")" \
    LESS_TERMCAP_md="$(printf "\e[1;31m")" \
    LESS_TERMCAP_me="$(printf "\e[0m")" \
    LESS_TERMCAP_se="$(printf "\e[0m")" \
    LESS_TERMCAP_so="$(printf "\e[1;44;33m")" \
    LESS_TERMCAP_ue="$(printf "\e[0m")" \
    LESS_TERMCAP_us="$(printf "\e[1;32m")" \
    man "${@}"
}
