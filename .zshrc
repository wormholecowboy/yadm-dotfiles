# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Editor
export EDITOR=nvim

# Key Bindings
bindkey -e

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
# plug "zap-zsh/zap-prompt"
# plug "zettlrobert/simple-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/nvm"
plug "romkatv/powerlevel10k"
# plug "zap-zsh/fzf"
# plug "wintermi/zsh-lsd"


# Load and initialise completion system
autoload -Uz compinit
compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# RUN THESE
. ~/z/z.sh


# PATH
export PATH="$PATH:/opt/stylua"


# FZF configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"


# ALIAS
alias ga="git add ."
alias gc="git commit"
alias gp="git push"

alias nrd="npm run dev"
alias nv='nvim'

# alias cat="bat"
# alias ll="ls -l -a -o --color -h --group-directories-first"
alias ls="exa -lha --icons --group-directories-first"
alias lt="exa -l --icons --tree"
alias lsn="exa -lh --icons --group-directories-first"
alias evim="nvim $HOME/.config/nvim"
alias ezsh="nvim $HOME/.zshrc"
alias etm="nvim $HOME/.tmux.conf"
alias pn="nvim $HOME/pnotes"

alias ys="yadm status"
alias yau="yadm add -u"
alias yc="yadm commit -m"
alias yc="yadm push -u origin master:main"


# export less="$less -R -Q"