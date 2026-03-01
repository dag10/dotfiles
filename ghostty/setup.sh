#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

mkdir -p "$HOME/.config/fish"

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~/.config)"

info "Setting up Ghostty..."

substep_info "Installing Ghostty from homebnrew..."
brew install --cask ghostty

substep_info "Creating Ghostty config folders..."
#mkdir -p "$DESTINATION/ghostty"

substep_info "Linking Ghostty configs..."
symlink "$SOURCE/ghostty" "$DESTINATION/ghostty"
#find ghostty -type file | while read fn; do
    #echo symlink "$SOURCE/$fn" "$DESTINATION/$fn"
#done

success "Successfully set up Ghostty."

