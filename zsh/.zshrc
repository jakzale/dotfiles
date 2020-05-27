
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

function pathify () {
    local entry="$1"
    local current=("${(@s/:/)PATH}")

    if [[ ${current[(ie)${entry}]} -gt ${#current} ]]; then
        export PATH="$entry:$PATH"
    fi
}

# Setting up $PATH and other variables

pathify "/snap/bin"
# include cargo if it exists
if [ -d "$HOME/.cargo/bin" ] ; then
    pathify "$HOME/.cargo/bin"
fi

# include go if it exists
if [ -d "$HOME/.local/go" ] ; then
    pathify "$HOME/.local/go/bin"
    export GOPATH="$HOME/Developer/go"
fi

pathify  "$HOME/.local/bin"

# Path to your oh-my-zsh installation.
export ZSH="/home/jakub/.oh-my-zsh"

# EDITOR
export EDITOR='nvim'

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM="${HOME}/.config/oh-my-zsh"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git stack cargo ubuntu taskwarrior)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


# try setting SSH_AUTH_SOCK if unset

if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

# Setup gh completion
eval $(gh completion --shell zsh)

# Quick hack to unlock default key for gpg
export GPG_TTY=$(tty)
alias gpg-unlock='echo "" | gpg -s > /dev/null'

alias nec='nvim +Files\ ~/.config'

# Use shell pid for nvim address
# TODO Not sure how useful this will be
export NVIM_LISTEN_ADDRESS="${NVIM_LISTEN_ADDRESS:-${XDG_RUNTIME_DIR}/nvim/${$}-socket}"

function ui-alacritty-scaled () {
    local config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"
    local alacritty_config="${config_dir}/alacritty/alacritty.yml"
    sed --in-place 's/size: 16.0/size: 12.0/' "${alacritty_config}"
}

function ui-alacritty-unscaled () {
    local config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"
    local alacritty_config="${config_dir}/alacritty/alacritty.yml"
    sed --in-place 's/size: 12.0/size: 16.0/' "${alacritty_config}"
}

# Scale the UI up
function ui-sway-scaled () {
    # Turn on scaling
    swaymsg -- output eDP-1 scale 2
}

function ui-sway-unscaled () {
    # Turn off scaling
    swaymsg -- output eDP-1 scale 1
}

function ui-scaled () {
    ui-alacritty-scaled
    ui-sway-scaled
}

function ui-unscaled () {
    ui-alacritty-unscaled
    ui-sway-unscaled
}

alias hnterm="TERM=xterm-256color hnterm"

alias sway-outputs="swaymsg -t get_outputs"
