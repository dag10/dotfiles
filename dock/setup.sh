#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

info "Configuring dock..."

brew install dockutil

dockutil --no-restart --remove all
#dockutil --no-restart --add "/System/Applications/Safari.app"
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/1Password.app"
dockutil --no-restart --add "/Applications/Spotify.app"
#dockutil --no-restart --add "/System/Applications/Calendar.app"
dockutil --no-restart --add "/System/Applications/Reminders.app"
dockutil --no-restart --add "/System/Applications/Calendar.app"
dockutil --no-restart --add "/System/Applications/Mail.app"
dockutil --no-restart --add "/System/Applications/Messages.app"
dockutil --no-restart --add "/Applications/Messenger.app"
dockutil --no-restart --add "/Applications/Telegram.app"
dockutil --no-restart --add "/System/Applications/System Preferences.app"
dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"
#dockutil --no-restart --add "/Applications/Unity/Unity.app"
dockutil --no-restart --add "/Applications/Figma.app"
dockutil --no-restart --add "/Applications/Steam.app"
dockutil --no-restart --add "/Applications/Discord.app"
#dockutil --no-restart --add "/Applications/Microsoft Teams.app"
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/Applications/zoom.us.app"
dockutil --no-restart --add "/Applications/Shearwater Cloud.app"
dockutil --no-restart --add "/Applications/Adobe Lightroom CC/Adobe Lightroom.app"
dockutil --no-restart --add "/Applications/Sentry Viewer.app"
dockutil --no-restart --add "/Users/drew/Downloads"

killall Dock

success "Finished configuring dock."
