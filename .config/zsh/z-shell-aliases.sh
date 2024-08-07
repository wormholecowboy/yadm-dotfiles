
# CAT
if [[ $(uname) == "Linux" ]]; then
  alias cat="batcat"
  bat_command="batcat"
else 
  alias cat="bat"
  bat_command="bat"
fi
alias nvs='nvim $(fzf -m --preview="$bat_command --color=always {}")' # tab for multi select


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
alias gcb="~/scripts/git-bare.sh"

alias nrd="npm run dev"
alias nv='nvim'
alias py='python3'
alias lf='lfcd'
alias cl="clear"
alias cds='cd $(find . -type d | fzf)'

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

alias s2l="source ~/scripts/export-aws-creds.sh"
alias awh="source ~/scripts/aws-wormhole/aws-main.sh"
alias tfa="terraform apply"
alias tfi="terraform init"
alias tfv="terraform -v"
