
plugins=(1password copybuffer git jira zsh-autosuggestions)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="eastwood"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Command execution timestamp shown in the history command output.
HIST_STAMPS="dd/mm/yyyy"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH=/opt/homebrew/bin:$PATH

### Git PS1 Config
autoload -Uz vcs_info # enable vcs_info
precmd () { vcs_info } # always load before displaying the prompt
zstyle ':vcs_info:*' formats ' %s(%F{red}%b%f)'
PS1='%n@%m %F{red}%/%f$vcs_info_msg_0_ ## '

### Aliases
#### Git
alias gs="git status"
alias gpm="git fetch origin main:main"
alias gpull="git pull"
alias gpush="git push"
alias ga="git add"
alias gc="git commit -m"
alias gch="git checkout"

#### Yarn
alias yi="yarn install"
alias yt="yarn test"

#### Other
alias zc="nvim ~/.zshrc"
alias reload="source ~/.zshrc"
alias dev="cd ~/dev"
alias history="fc -fl 1"

source $ZSH/oh-my-zsh.sh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
