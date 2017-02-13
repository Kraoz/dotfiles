# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme robbyrussell

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

set RAILS_ENV development

set PATH $PATH "$HOME/.node/bin"

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

alias l='ls -lGh'
alias ll='l'
alias e='emacs'
alias la='l -a'
alias cl='clean'
alias rm='rm -v'
alias mv='mv -v'
alias g='grep'
alias reload='source ~/.config/fish/config.fish'
alias clean='rm `find . -name "*~"`'
alias ssh='ssh -o TCPKeepAlive=yes -o ServerAliveCountMax=5 -o ServerAliveInterval=5 -A'

setenv LSCOLORS gxfxcxdxcxegedabagacad
setenv EDITOR atom

setenv NPM_PACKAGES $HOME/.npm-packages
setenv PATH $PATH $NPM_PACKAGES/bin
setenv MANPATH $MANPATH $NPM_PACKAGES/share/man
setenv NODE_PATH $NPM_PACKAGES/lib/node_modules:$NODE_PATH

setenv PATH (brew --prefix homebrew/php/php56)/bin $PATH

export REACT_APP_ENV=test

status --is-interactive; and . (rbenv init -|psub)

function subl
  /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl
end

function be
  bundle exec $argv
end

function re
  env RAILS_ENV=$argv[1] $argv[2..-1]
end

function rebe
  env RAILS_ENV=$argv[1] bundle exec $argv[2..-1]
end

function rbs
  rebe remote_staging $argv
end

function migr
  atom (be rails g migration $argv | grep -E 'create\s+db/migrate' | sed 's/      create    //g')
end

function log
  tail -n 1000 -f ./log/$argv.log | grep-out-rails-vendor
end

function grep-out-rails-vendor
  grep -vE '(vendor|/Application Support/Pow)'
end

function startDockerMachine
  docker-machine start default > /dev/null
  eval (docker-machine env default)
end

function nvm
  bass source ~/.nvm/nvm.sh ';' nvm $argv
end

function venvstart
  source ~/.virtualenvs/$argv[1]/bin/activate.fish
end
