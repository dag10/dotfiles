#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

# Some minimal prereq packages that are largely redundant with those in
# the Brewfile. Still useful if I run this setup script on its own.
brew install trash
brew install fish
brew install fzf

. ../scripts/functions.sh

mkdir -p "$HOME/.config/fish"

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~/.config/fish)"

info "Setting up fish shell..."

substep_info "Installing oh-my-fish"
git submodule update --init
oh-my-fish/bin/install --offline --path=~/.local/share/omf --config=~/.config/omf --noninteractive

substep_info "Installing bobthefish"
fish -c "omf install bobthefish"

info "Downloading iTerm2 integration script"
curl -L https://iterm2.com/shell_integration/fish -o "$SOURCE/iterm2_shell_integration.fish"

substep_info "Creating fish config folders..."
mkdir -p "$DESTINATION/functions"
mkdir -p "$DESTINATION/functions/theme-bobthefish"
mkdir -p "$DESTINATION/completions"

find . -name "*.fish" -not -path "./oh-my-fish/*" | while read fn; do
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done

set_fish_shell() {
#    if grep --quiet fish <<< "$SHELL"; then
#        success "Fish shell is already set up."
#    else
        substep_info "Adding fish executable to /etc/shells"
        if grep --fixed-strings --line-regexp --quiet "/opt/homebrew/bin/fish" /etc/shells; then
            substep_success "Fish executable already exists in /etc/shells."
        else
            if sudo bash -c "echo /opt/homebrew/bin/fish >> /etc/shells"; then
                substep_success "Fish executable added to /etc/shells."
            else
                substep_error "Failed adding Fish executable to /etc/shells."
                return 1
            fi
        fi
        substep_info "Changing shell to fish"
        if chsh -s /opt/homebrew/bin/fish; then
            substep_success "Changed shell to fish"
        else
            substep_error "Failed changing shell to fish"
            return 2
        fi
#    fi
}

touch ~/.hushlogin

if set_fish_shell; then
    success "Successfully set up fish shell."
else
    error "Failed setting up fish shell."
fi

