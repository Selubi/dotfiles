#####################################################
#                                                   #
#   THIS FILE IS MANAGED BY ANSIBLE.                #
#   DO NOT EDIT DIRECTLY!                           #
#   YOUR CHANGES WILL BE OVERWRITTEN!               #
#   It will be reset on the next Ansible run.       #
#   Create ~/.zprofile.private for customizations.  #
#                                                   #
#####################################################

eval $(/opt/homebrew/bin/brew shellenv)

if [ -f "$HOME"/.zprofile.private ]; then
    source "$HOME"/.zprofile.private
fi
