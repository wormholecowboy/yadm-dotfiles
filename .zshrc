
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

# ALIASES
source ~/scripts/conditional-aliases.sh

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
