

# Editor
export EDITOR=nvim
export XDG_CONFIG_HOME=~/.config

# Key Bindings
bindkey -e

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/nvm"
plug "zap-zsh/fzf"
plug "Aloxaf/fzf-tab"

# Load and initialise completion system
autoload -Uz compinit
compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# SET OPTIONS
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus


# SOURCE THESE
. ~/scripts/dirchanger.sh
. ~/.config/lf/lfcd.sh
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
# PATH
export PATH="$PATH:/opt/stylua"
export PATH="$PATH:/usr/local/lf"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/home/brian/bin"


# FZF configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"


# ALIAS
alias ga="git add -A"
alias gb="git branch -a"
alias gc="git commit"
alias gd="git diff"
alias gco="git checkout"
alias gp="git push"
alias gs="git status -s"
alias gst="git status"
alias gl="git log"
alias glg="git log --oneline --decorate --graph --all"
alias glo="git log --oneline"
alias gw="git worktree"
alias gwf="git fetch origin '*:*' --update-head-ok"
alias gcb="git clone --bare"

alias nrd="npm run dev"
alias nv='nvim'

alias py='python3'
alias lf='lfcd'
alias cat="bat"
alias cl="clear"

alias ls="exa -lha --icons --group-directories-first"
alias ll="exa -lha --color=always --group-directories-first | less -r"
alias lt="exa -l --icons --tree"
alias lsn="exa -lh --icons --group-directories-first"
alias rmdir="rm -rf"

alias evim="yadm enter nvim $HOME/.config/nvim"
alias ezsh="yadm enter nvim $HOME/.zshrc"
alias etm="yadm enter nvim $HOME/.tmux.conf"
alias pn="nvim $HOME/pnotes"
alias et="nvim $HOME/temp"
alias eb="nvim $HOME/temp/blank.txt"

alias ys="yadm status"
alias ya="yadm add -u"
alias yc="yadm commit"
alias yp="yadm push"

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias specs="inxi -Fxxxc0z"
alias grep="grep --color=auto"

alias s2l="saml2aws login"
alias s2s="source ~/scripts/export-aws-creds.sh"
alias tfa="terraform apply"
alias tfi="terraform init"
alias tfv="terraform -v"











export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
