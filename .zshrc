#####################################################
#                                                   #
#   THIS FILE IS MANAGED BY ANSIBLE.                #
#   DO NOT EDIT DIRECTLY!                           #
#   YOUR CHANGES WILL BE OVERWRITTEN!               #
#   It will be reset on the next Ansible run.       #
#   Create ~/.zshrc.private for customizations.     #
#                                                   #
#####################################################

# Inspired by https://github.com/dreamsofautonomy/zensh

########################################
# Keybindings                          #
########################################
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

########################################
# Terminal colors                      #
########################################
# Massive kudos to https://superuser.com/questions/290500/zsh-completion-colors-and-os-x

# Indicate programs that this terminal is color compatible
# e.g. ls will automatically color without alias if this is available
export CLICOLOR=1

# Default color on macos
# Note that these color will be mapped again by what theme you use in the terminal
# e.g. Cyan here can be mapped to Red depending on the theme
# Documentation: https://www.zintis.net/LSCOLORS.html
export LSCOLORS=exfxcxdxbxegedabagacad

# Same as LSCOLORS above, but in GNU representation
# Converter: https://geoff.greer.fm/lscolors/
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

########################################
# Homebrew and zinit                   #
########################################

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Zinit
source $HOMEBREW_PREFIX/opt/zinit/zinit.zsh

# Add in starship prompt
zinit ice as"command" from"gh-r" \
    atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
    atpull"%atclone" src"init.zsh"
zinit light starship/starship

# Add in zsh plugins
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
# zinit snippet OMZL::git.zsh
# zinit snippet OMZP::git
# zinit snippet OMZP::sudo
# zinit snippet OMZP::archlinux
# zinit snippet OMZP::aws
# zinit snippet OMZP::kubectl
# zinit snippet OMZP::kubectx
# zinit snippet OMZP::command-not-found

########################################
# Completion styling                   #
########################################

# Disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false

# Matching is case-agnostic
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Colors suggestion
# Massive kudos to https://superuser.com/questions/290500/zsh-completion-colors-and-os-x
# Ignore the error if you're seeing one by shell-format extension on vscode. It works.
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no

# Preview directory's content with ls when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

########################################
# History                              #
########################################
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

########################################
# Shell Integrations                   #
########################################

# fzf
eval "$(fzf --zsh)"

# zoxide
eval "$(zoxide init --cmd cd zsh)"

########################################
# Customization                        #
########################################

if [ -f "$HOME"/.zshrc.private ]; then
    source "$HOME"/.zshrc.private
fi
