echo start
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="af-magic"
# ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

echo before source
source $ZSH/oh-my-zsh.sh
echo after source

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

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
alias ll="ls -lahtr"
alias notes="cd /Users/maxpopov/Google\ Drive/My\ Drive/notes/ && vi ."
alias k="kubectl"
alias k-eu="kubectl config use-context arn:aws:eks:eu-west-1:818631177882:cluster/prd-eu-w1-132v2"
alias k-stg="kubectl config use-context arn:aws:eks:eu-north-1:264911049221:cluster/staging-group-132v2"
alias k-us="k-switch arn:aws:eks:us-east-1:042237075729:cluster/prd-us-e1-132v2"
alias k-alfred="kubectl config use-context arn:aws:eks:eu-north-1:264911049221:cluster/eu-alfred-group-alfred"
alias k-jarvis="kubectl config use-context arn:aws:eks:eu-west-1:818631177882:cluster/jarvis"
alias k-bender="k-switch arn:aws:eks:us-east-1:174579409846:cluster/bender"
alias k-dev="kubectl config use-context arn:aws:eks:us-east-1:723759117883:cluster/dev-main-cluster"
alias k-au="k-switch arn:aws:eks:ap-southeast-2:174579409846:cluster/prd-ap-se2-132v2"
alias k-dev-ci="k-switch arn:aws:eks:us-east-1:723759117883:cluster/dev-ci-main-cluster"
alias k-ca="k-switch arn:aws:eks:ca-central-1:654654577882:cluster/prd-ca-c1-132v2"
alias k-uk="k-switch arn:aws:eks:eu-west-2:615299730828:cluster/prd-eu-w2-132v2"
alias stress-tests="cd /Users/mqxter/scm/github/stress-tests"
alias gprf="git pull --rebase && git fetch --tags --force"
alias k-london="k-switch arn:aws:eks:eu-west-2:767397817442:cluster/london-main-cluster"
alias gl="git log --pretty=format:'%C(green)%h %Cred%ad %C(magenta)%an%C(yellow)%d %Creset%s' --date=short --graph"
# alias k-get="kubectl config get-contexts"
# alias k-get="kubectl config get-contexts --no-headers | awk '{if ($1 == "\*") print $1\" \"$2; print $2}' "
alias k-get="~/.k-get-awk.sh"
alias k-switch="kubectl config use-context"
alias stateops="cd /Users/maxpopov/source-control/StateOps"
# alias gb="git for-each-ref --sort=committerdate refs/heads/ --format='%(committerdate:short) %(authorname) %(refname:short)'"
alias gbsort="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"
alias gcam="fgcam"
alias gpoc="fgpoc"
alias gcampoc="fgcampoc"
# alias gcampoc="gcam() && gpoc()"
# working directory is source-control
function fgcam () {
  msg="$(gb --show-current)"
  echo commiting with message: $msg
  gc -am "$msg"
}
function fgpoc () {
  branch=$(gb --show-current)
  echo pushing into origin branch: $branch
  git push origin $branch --set-upstream }
function fgcampoc () { gcam; gpoc; }

cd /Users/maxpopov/source-control

# go crap
# export GOROOT="/usr/local/go"
# export GOPATH="$HOME/Documents/go"
# export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"
eval "$(starship init zsh)"
export PATH="/opt/homebrew/opt/mysql-client@8.4/bin:$PATH"

export AWS_DEFAULT_OUTPUT="json"
export AWS_PAGER=""
echo done

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
