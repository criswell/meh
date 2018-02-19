# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="ysfork"
#ZSH_THEME="blinks2"
ZSH_THEME="blinks"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git mercurial zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl:/home/sam/bin:/home/sam/.gem/ruby/2.0.0/bin:/home/sam/.cabal/bin:/home/sam/.gem/ruby/1.9.1/bin

export LC_ALL=
export EDITOR="vim"
export LC_COLLATE="C"
export LANG="en_US.UTF-8"

alias tmux="tmux -2"

INC_APPEND_HISTORY="false"
SHARE_HISTORY="false"
EXTENDED_HISTORY="true"

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

#autoload -U up-line-or-beginning-search
#autoload -U down-line-or-beginning-search
#zle -N up-line-or-beginning-search
#zle -N down-line-or-beginning-search
#bindkey "^[[A" up-line-or-beginning-search # Up
#bindkey "^[[B" down-line-or-beginning-search # Down
#autoload -U history-beginning-search-backward
#autoload -U history-beginning-search-forward
#zle -N history-beginning-search-backward
#zle -N history-beginning-search-forward
#bindkey "^[[A" history-beginning-search-backward # Up
#bindkey "^[[B" history-beginning-search-forward # Down

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
#bindkey "^[0A" up-line-or-beginning-search # Up
#bindkey "^[0B" down-line-or-beginning-search # Down
# keybindings for history autocomplete
[[ -n "${key[Up]}" ]] && bindkey "${key[Up]}" up-line-or-beginning-search 
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" down-line-or-beginning-search

if [ -d "$HOME/.local/bin" ]; then
    export PATH="$PATH:$HOME/.local/bin"
fi

if [ -d "$HOME/work/git-plugins/bin" ] ; then
    export PATH="$PATH:$HOME/work/git-plugins/bin"
fi

if [ -d "$HOME/.cargo/bin" ]; then
    export PATH="$PATH:$HOME/.cargo/bin"
fi

if [ -d "$HOME/bin" ]; then
    export PATH="$PATH:$HOME/bin"
fi

# For Mac OS X
if [ -d "$HOME/Library/Python/2.7/bin" ]; then
    export PATH="$PATH:$HOME/Library/Python/2.7/bin"
fi

if [ -d "$HOME/lib/rose" ]; then
    export ROSELIB_PATH="$HOME/lib/rose"
fi

if [ -d "$HOME/lib/cq" ]; then
    export CQLIB_PATH="$HOME/lib/cq"
fi

if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

stty -ixon

PATH="/home/sam/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/sam/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/sam/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/sam/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/sam/perl5"; export PERL_MM_OPT;

# Less syntax highlighting
highlight_filter=$(which source-highlight-esc.sh)
if [ -x "$highlight_filter" ]; then
    export LESSOPEN="| ${highlight_filter} %s"
    export LESS=' -N -R '
else
    export LESS=' -N -R'
fi

if [ -e "$HOME/.env_exports" ]; then
    source ~/.env_exports
fi

export MANPAGER='less -n'

if hash fuck 2>/dev/null; then
    eval $(thefuck --alias)
fi

#export NVM_DIR="$HOME/.nvm"
#. "/usr/local/opt/nvm/nvm.sh"

function npm-do { (PATH=$(npm bin):$PATH; eval $@;) }
