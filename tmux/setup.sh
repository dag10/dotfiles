#!/bin/bash

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~)"

info "Downloading sensible-tmux..."
git submodule update --init

info "Configuring tmux..."
find . -name ".tmux*" | while read fn; do
    fn=$(basename $fn)
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done

info "Downloading tmux plugin manager..."
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

info "Installing tmux plugins..."
~/.tmux/plugins/tpm/bin/install_plugins

success "Finished configuring tmux."
