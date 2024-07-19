#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

COMMENT=\#*

sudo -v

info "Installing MAS"
brew install mas

info "Installing Xcode"
mas install 497799835
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer

info "Installing Brewfile packages..."
brew bundle -v
success "Finished installing Brewfile packages."

info "Installing Rosetta 2"
softwareupdate --install-rosetta --agree-to-license

find * -name "*.list" | while read fn; do
    cmd="${fn%.*}"
    set -- $cmd
    info "Installing $1 packages..."
    while read package; do
        if [[ $package == $COMMENT ]];
        then continue
        fi
        substep_info "Installing $package..."
        if [[ $cmd == code* ]]; then
            $cmd $package
        else
            $cmd install $package
        fi
    done < "$fn"
    success "Finished installing $1 packages."
done

sudo xcodebuild -license accept

