#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

info "Configuring dock..."

brew install dockutil

dockutil --no-restart --remove all
#dockutil --no-restart --add "/Applications/Safari.app"
dockutil --no-restart --add "/Applications/Spotify.app"
#dockutil --no-restart --add "/Applications/Calendar.app"
dockutil --no-restart --add "/Applications/Reminders.app"
dockutil --no-restart --add "/Applications/Messages.app"
dockutil --no-restart --add "/Applications/Messenger.app"
dockutil --no-restart --add "/Applications/System Preferences.app"
dockutil --no-restart --add "/Applications/iTerm.app"
#dockutil --no-restart --add "/Applications/Unity/Unity.app"
dockutil --no-restart --add "/Applications/Figma.app"
dockutil --no-restart --add "/Applications/Steam.app"
dockutil --no-restart --add "/Applications/Discord.app"
dockutil --no-restart --add "/Applications/Microsoft Teams.app"
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/Applications/zoom.us.app"
dockutil --no-restart --add "/Users/drew/Downloads"

killall Dock

success "Finished configuring dock."
