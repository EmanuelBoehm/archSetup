# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/emi/.zshrc'
alias vim=nvim
(cat ~/.cache/wal/sequences &)
autoload -Uz compinit
compinit
export PATH=/home/emi/.cargo/bin:/home/emi/.my_bin:$PATH
export PROMPT=' %~ %# '
