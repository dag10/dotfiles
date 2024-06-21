#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

info "Configuraing fonts..."

git submodule update --init
cp powerline-fonts/Meslo/* /Library/Fonts/
cp powerline-fonts/Menlo/* /Library/Fonts/
cp Meslo_M-DZ_Nerd/*/* /Library/Fonts/

success "Finished configuring fonts."
