#####################################################
#                                                   #
#   THIS FILE IS MANAGED BY ANSIBLE.                #
#   DO NOT EDIT DIRECTLY!                           #
#   YOUR CHANGES WILL BE OVERWRITTEN!               #
#   It will be reset on the next Ansible run.       #
#   Create ~/.zshrc.private for customizations.     #
#                                                   #
#####################################################

eval $(/opt/homebrew/bin/brew shellenv)
eval "$(starship init zsh)"

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [ -f "$HOME"/.zshrc.private ]; then
    source "$HOME"/.zshrc.private
fi
