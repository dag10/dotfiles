#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~)"

info "Setting up Vim..."

git submodule update --init

./drew-vimrc/setup_vimrc.sh

success "Finished setting up Vim."
