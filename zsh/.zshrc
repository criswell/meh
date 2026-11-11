# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="ysfork"
#ZSH_THEME="blinks2"
#ZSH_THEME="blinks"
#ZSH_THEME="mortalscumbag"
#ZSH_THEME="agnoster"
#ZSH_THEME="agnosterzak"
ZSH_THEME="powerlevel10k/powerlevel10k"

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
plugins=(git zsh-autosuggestions wd poetry asdf)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl:/home/sam/bin:/home/sam/.cabal/bin:/snap/bin:/home/sam/.local/bin

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

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# keybindings for history autocomplete
[[ -n "${key[Up]}" ]] && bindkey "${key[Up]}" up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" down-line-or-beginning-search

if [ -d "$HOME/.local/bin" ]; then
    export PATH="$PATH:$HOME/.local/bin"
fi

if [ -d "$HOME/.cargo/bin" ]; then
    export PATH="$PATH:$HOME/.cargo/bin"
fi

if [ -d "$HOME/lib/rose" ]; then
    export ROSELIB_PATH="$HOME/lib/rose"
fi

if [ -d "$HOME/bin" ]; then
    export PATH="$PATH:$HOME/bin"
fi

if [ -d "$HOME/.rvm/bin" ]; then
    # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
    export PATH="$PATH:$HOME/.rvm/bin"
fi

if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -e 'puts Gem.user_dir')/bin:$PATH"
fi

# NPM bullshit
NPM_PACKAGES="${HOME}/node_modules"

export PATH="$PATH:$NPM_PACKAGES/.bin"

if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

#stty -ixon

export LESS="NReFX"
# Less syntax highlighting
highlight_filter=$(which source-highlight-esc.sh)
if [ -x "$highlight_filter" ]; then
    export LESSOPEN="| ${highlight_filter} %s"
fi

if [ -e "$HOME/.env_exports" ]; then
    source ~/.env_exports
fi

export MANPAGER='less -n'

if hash fuck 2>/dev/null; then
    eval $(thefuck --alias)
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ ! -f ~/.zpm/zpm.zsh ]]; then
  git clone --recursive https://github.com/zpm-zsh/zpm ~/.zpm
fi
source ~/.zpm/zpm.zsh

zpm load zpm-zsh/autoenv

#eval "$(rbenv init - zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# bun completions
[ -s "/home/sam/.bun/_bun" ] && source "/home/sam/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# dox-agent PATH (removed 2026-08-18: legacy launcher retired, go-native binary lives in ~/.local/bin)
# export PATH="/home/sam/work/doximity/agentic-dev/bin:$PATH"

# NPM global bin (added by Qwen Code installer)
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="/home/sam/.local/bin:$PATH"

# Abacus AI CLI
export PATH="/home/sam/.abacusai/bin:$PATH"

# claude-fireworks: toggle claude between native Anthropic and Fireworks AI backend.
# dox-agent --fireworks currently broken (see dox-agent-improvements cerebrum project),
# so this sets/unsets the ANTHROPIC_* env vars directly.
claude-fireworks() {
    if [[ -n "$_FIREWORKS_ACTIVE" ]]; then
        unset ANTHROPIC_BASE_URL ANTHROPIC_API_KEY ANTHROPIC_DEFAULT_SONNET_MODEL \
              ANTHROPIC_DEFAULT_OPUS_MODEL ANTHROPIC_SMALL_FAST_MODEL ANTHROPIC_DEFAULT_HAIKU_MODEL \
              _FIREWORKS_ACTIVE
        echo "claude-fireworks: switched back to native Anthropic backend"
    else
        local key="${DOX_FIREWORKS_API_KEY:-$FIREWORKS_API_KEY}"
        if [[ -z "$key" ]]; then
            echo "claude-fireworks: DOX_FIREWORKS_API_KEY (or FIREWORKS_API_KEY) is not set" >&2
            return 1
        fi
        export ANTHROPIC_BASE_URL="https://api.fireworks.ai/inference"
        export ANTHROPIC_API_KEY="$key"
        export ANTHROPIC_DEFAULT_SONNET_MODEL="accounts/fireworks/models/kimi-k2p7-code"
        export ANTHROPIC_DEFAULT_OPUS_MODEL="accounts/fireworks/models/kimi-k2p7-code"
        export ANTHROPIC_SMALL_FAST_MODEL="accounts/fireworks/models/glm-5p2"
        export ANTHROPIC_DEFAULT_HAIKU_MODEL="accounts/fireworks/models/glm-5p2"
        export _FIREWORKS_ACTIVE=1
        echo "claude-fireworks: switched to Fireworks backend (kimi-k2p7-code / glm-5p2)"
    fi
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/sam/google-cloud-sdk/path.zsh.inc' ]; then . '/home/sam/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/sam/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/sam/google-cloud-sdk/completion.zsh.inc'; fi
