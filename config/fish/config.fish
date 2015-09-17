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

set -x DOCKER_HOST tcp://192.168.59.103:2376
set -x DOCKER_CERT_PATH ~/.boot2docker/certs/boot2docker-vm
set -x DOCKER_TLS_VERIFY 1
set -x PATH $PATH ~/.composer/vendor/bin

fish_vi_mode
