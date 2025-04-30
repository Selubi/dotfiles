eval $(/opt/homebrew/bin/brew shellenv)

if [ -f "$HOME"/.zprofile.private ]; then
    source "$HOME"/.zprofile.private
fi