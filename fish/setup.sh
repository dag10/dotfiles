#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

mkdir -p "$HOME/.config/fish"

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~/.config/fish)"

info "Setting up fish shell..."

substep_info "Installing bobthefish"
fish installomf --path=~/.local/share/omf --config=~/.config/omf --noninteractive
fish -c "omf install bobthefish"

substep_info "Creating fish config folders..."
mkdir -p "$DESTINATION/functions"
mkdir -p "$DESTINATION/functions/theme-bobthefish"
mkdir -p "$DESTINATION/completions"

find * -name "*.fish" | while read fn; do
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done

set_fish_shell() {
    if grep --quiet fish <<< "$SHELL"; then
        success "Fish shell is already set up."
    else
        substep_info "Adding fish executable to /etc/shells"
        if grep --fixed-strings --line-regexp --quiet "/usr/local/bin/fish" /etc/shells; then
            substep_success "Fish executable already exists in /etc/shells."
        else
            if sudo bash -c "echo /usr/local/bin/fish >> /etc/shells"; then
                substep_success "Fish executable added to /etc/shells."
            else
                substep_error "Failed adding Fish executable to /etc/shells."
                return 1
            fi
        fi
        substep_info "Changing shell to fish"
        if chsh -s /usr/local/bin/fish; then
            substep_success "Changed shell to fish"
        else
            substep_error "Failed changing shell to fish"
            return 2
        fi
    fi
}

touch ~/.hushlogin

if set_fish_shell; then
    success "Successfully set up fish shell."
else
    error "Failed setting up fish shell."
fi

