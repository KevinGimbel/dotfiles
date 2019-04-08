[ -f ~/.aliases ] && source ~/.aliases

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi