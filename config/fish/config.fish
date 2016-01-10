# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme clearance2

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

. $HOME/.config/fish/config.orig

if [ -d /usr/local/texlive/2014/bin/x86_64-darwin ]
  set PATH $PATH /usr/local/texlive/2014/bin/x86_64-darwin
end

if [ -d /usr/local/sbin ]
  set PATH $PATH /usr/local/sbin
end

if [ -d /usr/local/lib/pkgconfig ]
 set PKG_CONFIG_PATH $PKG_CONFIG_PATH /usr/local/lib/pkgconfig
end

if [ -d /usr/local/lib ]
 set PKG_CONFIG_PATH $PKG_CONFIG_PATH /usr/local/lib
end

# alias mvim='open -a MacVim'
