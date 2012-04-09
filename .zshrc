# =============== #
#   Environment   #
# =============== #

export EDITOR="mate -w"

# Homebrew
export PATH="/usr/local/bin:$PATH"

# Ruby
export PATH="/usr/local/ruby/1.9.3-p125/bin:$PATH"
# export PATH="/usr/local/ruby/1.9.2-p290/bin:$PATH"
# export PATH="/usr/local/ruby/ree-1.8.7-2011.03/bin:$PATH"

# Python
export PATH="/usr/local/share/python:$PATH"
# export PATH="/usr/local/share/python3:$PATH"

# Custom
export PATH="$HOME/bin:$PATH"

# Node
export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"


# =========== #
#   Aliases   #
# =========== #

alias reload="source ~/.zshrc"
alias config="mate ~/.zshrc"
alias setup="mate -w ~/.zshrc && reload"

alias back='cd $OLDPWD'

alias m.="mate ."
alias o.="open ."

alias showhidden="defaults write com.apple.finder AppleShowAllFiles true && killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles false && killall Finder"

alias be='bundle exec ' # note the trailing space to trigger chaining
alias mongod_="mongod --dbpath /usr/local/var/mongodb/data/db"


# Git
alias gti="git" # shame

alias glog="git log --oneline --decorate"
alias gstatus="git status -sbu"
alias gdiff="git diff"
alias gadd="git add -p"
alias gcommit="git commit -v"
alias gcommita="git commit -va"
alias grebase="git rebase -i HEAD~10"
alias gpull="git pull --rebase origin"
alias gpush="git push origin"
alias gstash="git stash save"
alias gpop="git stash pop"
alias gclean="git clean -fd"
alias gsub="git submodule"
alias gsuba="git submodule add"
alias gsubi="git submodule init"
alias gsubu="git submodule update"


# ========== #
#   Prompt   #
# ========== #

# Colors
autoload -U colors
colors
setopt prompt_subst

# PROMPT
local percent="%(?,%{$fg[green]%}%#%{$reset_color%},%{$fg[red]%}%#%{$reset_color%})"

PROMPT='
%F{135}%~%{$reset_color%}  $(git-prompt.rb)
${percent} %{$reset_color%}'

RPROMPT='%F{16}$(date)%{$reset_color%}'

# History (stolen from oh-my-zsh)
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# Completions for Ruby, Git, etc.
autoload compinit
compinit
