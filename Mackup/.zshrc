
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
 if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
 fi


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  z
  #macos
  web-search 
  )


source $ZSH/oh-my-zsh.sh
#source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh





# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"


plugin=(
  pyenv
  )
eval "$(pyenv init -)"


POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
unset RPROMPT


#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh



# set up fzf key bindings and fuzzy completion
#eval "$(fzf --zsh)"


#----------------------Aliases-----------------------------------------
# from https://www.youtube.com/watch?v=iagjeLuxnMs
#
alias v=nvim
alias nvim-ks='NVIM_APPNAME="nvim-ks" nvim'
alias nvim-tc='NVIM_APPNAME="nvim-tc" nvim'

# alias rm
alias rm="rm -iv"

# alias cd
alias cd="z"
eval "$(zoxide init zsh)"

alias cerebro="cd ~/cereberum"
alias dotfiles="cd ~/dotfiles/"
alias sai="cd ~/symphonyai/"
alias flow="cd ~/symphonyai/sail-flows/"
alias rag="cd ~/symphonyai/sail-rag/"
alias canvas="cd ~/symphonyai/flow-canvas-ui/"
alias study="cd ~/study/"

# alias docker="colima start; docker"


# ---- Eza (better ls) -----

alias ll="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias la="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions -la"

# find all files recursively and sorts by last modification, ignore hidden files
alias last='find . -type f -not -path "*/\.*" -exec ls -lrt {} +'

alias t='tmux'
alias e='exit'

# Fuzzy git checkout
alias gcof='_gcof() { 
    if [ -z "$1" ]; then
        echo "Usage: gcof <search_string>"
        return 1
    fi
    
    branch=$(git branch -a | grep -v HEAD | sed "s/remotes\/origin\///" | sed "s/^\* //" | sed "s/^  //" | sort -u | grep -i "$1" | fzf --prompt="Select branch: " --height=10)
    
    if [ -n "$branch" ]; then
        branch=$(echo "$branch" | xargs)
        echo "Checking out: $branch"
        git checkout "$branch"
    else
        echo "No branch selected or found matching '\''$1'\''"
    fi
}; _gcof'


# Created by `pipx` on 2024-09-02 00:15:33
export PATH="$PATH:/Users/rubert/.local/bin"


#----------------Poetry------
fpath+=~/.zfunc
autoload -Uz compinit && compinit


#--------- thefuck
# thefuck alias
eval $(thefuck --alias)
eval $(thefuck --alias fk)


#--- fzf.git

source ~/fzf-git.sh/fzf-git.sh


source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme


#--- fzf.git

source ~/fzf-git.sh/fzf-git.sh

# --- vi mode
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh



ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=7'



# Symphony AI development aliases
alias dev-ui='/Users/rubert/symphonyai/ui-dev-setup.sh'
alias workers='/Users/rubert/symphonyai/start_workers_filtered.sh'

# Load private environment variables
[ -f ~/.env_private ] && source ~/.env_private
