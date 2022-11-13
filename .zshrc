# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
export ZSH="$HOME/.ohmyzsh"
autoload -Uz compinit
compinit
HYPHEN_INSENSITIVE="true"
zstyle ':omz:update' mode auto # update automatically without asking
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
zstyle ':antidote:bundle' use-friendly-names 'yes'

source ${HOME}/.config/manicli.completion
source ${HOME}/scripts/ssh-find-agent.sh
source $(brew --prefix nvm)/nvm.sh
source ${HOME}/.rvm/scripts/rvm

[ -f ${HOME}/.fzf.zsh ] &&
    source ${HOME}/.fzf.zsh

if command -v pyenv 1>/dev/null 2>&1; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
fi

__conda_setup="$('/Users/elad.elgrabli/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/elad.elgrabli/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/elad.elgrabli/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/elad.elgrabli/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

source ${HOME}/.zsh_plugins.zsh
antidote load

PATH="/Users/elad.elgrabli/perl5/bin${PATH:+:${PATH}}"
export PATH
PERL5LIB="/Users/elad.elgrabli/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL5LIB
PERL_LOCAL_LIB_ROOT="/Users/elad.elgrabli/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_LOCAL_LIB_ROOT
PERL_MB_OPT='--install_base "/Users/elad.elgrabli/perl5"'
export PERL_MB_OPT
PERL_MM_OPT="INSTALL_BASE=/Users/elad.elgrabli/perl5"
export PERL_MM_OPT

# eval "$(starship init zsh)"
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _ignored _correct
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=1
zstyle :compinstall filename '/Users/elad.elgrabli/.zshrc'

source $ZSH/oh-my-zsh.sh

#plugin configuration block
export NVM_LAZY=1
export NVM_AUTOLOAD=1
export ZSH_COLORIZE_TOOL="chroma"
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes


# End of lines added by compinstall
eval "$(starship init zsh)"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
