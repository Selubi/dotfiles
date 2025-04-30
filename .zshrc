eval "$(starship init zsh)"

if [ -f "$HOME"/.zshrc.private ]; then
    source "$HOME"/.zshrc.private
fi