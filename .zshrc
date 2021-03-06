# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster_diy"

ZSH_THEME_RANDOM_CANDIDATES=(
  "robbyrussell"
  "agnoster_diy"
  )
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# extra plugins: dotenv rake rbenv ruby
plugins=(
  git
  sudo
  brew
  bundler
  osx
  # thefuck
  zsh-autosuggestions
  # autojump
  colored-man-pages
  brew
  zsh-syntax-highlighting
)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
function set_tmux_title () {
    printf '\033]2;'"$1"'\033\\'
}
 
function auto_tmux_title() {
    emulate -L zsh
    printf '\033]2;'"${PWD:t}"'\033\\'
}
 
auto_tmux_title
chpwd_functions=(${chpwd_functions[@]} "auto_tmux_title")

# innerpeace
export PATH=${PATH}:~/innerpeace/bin
alias vi="nvim"
alias cls='clear'
alias gcm='git commit'
alias srzsh='source ~/.zshrc'
alias vizsh='nvim ~/.zshrc'
alias vivim='nvim ~/.config/nvim/init.vim'
alias mdl='python3'
alias pip3='/usr/bin/python3.7 -m pip'
# alias proxy='export http_proxy=http://127.0.0.1:10887;export https_proxy=http://127.0.0.1:10887;'

# linux
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

# mac
alias cpwd='function lsf() {python3 -c "import os,sys; print(os.path.realpath(sys.argv[1] if len(sys.argv)==2 else \".\"),end=\"\")" $1};function _cpwd(){echo `lsf $1` | pbcopy && echo `pbpaste`}; _cpwd'
# alias lsf='function _lsf() {python -c "import os,sys; print(os.path.realpath(sys.argv[1]))" $1}; _lsf'
# alias cpwd='function _cpwd(){if [ $# -gt 0 ] ; then echo `lsf $1` && echo `lsf $1` | pbcopy;else echo `pwd` && echo `pwd` | pbcopy;fi}; _cpwd'

# X server
# export DISPLAY="127.0.0.1:11.0"
# export DISPLAY=:0
export DISPLAY=localhost:0
export TERM="xterm-256color"

export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# autosuggestions
bindkey '^b' forward-word
# bindkey '^a' autosuggest-accept
# Remove forward-char widgets from ACCEPT
# ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=("${(@)ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#forward-char}")

# Add forward-char widgets to PARTIAL_ACCEPT
# ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(forward-char)
# source $HOME/git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
