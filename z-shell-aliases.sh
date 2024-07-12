
# NEOVIM
if [[ $(uname) == "Linux" ]]; then
  alias nvs='nvim $(fzf --preview="batcat --color=always {}")'
else
  alias nvs='nvim $(fzf --preview="bat --color=always {}")'
fi
# add the -m flag to select multiple files with the tab key

# CHANGE DIR
if [[ $(uname) == "Linux" ]]; then
  alias cd='cd $(find . -type d | fzf --preview="batcat --color=always {}")'
else
  alias cd='cd $(find . -type d | fzf --preview="bat --color=always {}")'
fi
# add the -m flag to select multiple files with the tab key

# CAT
if [[ $(uname) == "Linux" ]]; then
  alias cat="batcat"
else 
  alias cat="bat"
fi


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
