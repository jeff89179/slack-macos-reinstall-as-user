#!/bin/bash

# Find the current console user
loggedInUser=$( scutil <<< "show State:/Users/ConsoleUser" | awk '/Name :/ && ! /loginwindow/ { print $3 }' )

# Download the latest version of Slack (Universal architecture - x86_x64 / arm64) to /Users/Shared/
curl -o /Users/Shared/slack-latest.dmg "https://slack.com/api/desktop.latestRelease?arch=universal&variant=dmg&redirect=true" -L

# Silently Mount the DMG
hdiutil attach /Users/Shared/slack-desktop-latest.dmg -nobrowse

# Copy Slack to the current console user's ~/Applications folder instead of the /Applications folder.
/Library/Addigy/user-job -user "$loggedInUser" -run mkdir -p /Users/$loggedInUser/Applications
/Library/Addigy/user-job -user "$loggedInUser" -run cp -r /Volumes/Slack/Slack.app /Users/$loggedInUser/Applications/ 

# Make sure Slack is not running before you remove the /Applications/Slack.app, then remove it.
killall Slack
rm -rf /Applications/Slack.app

# Unmount the Slack DMG
hdiutil detach -force /Volumes/Slack

# Remove the Slack DMG
rm /Users/Shared/slack-latest.dmg

# Fix "Slack is damaged" error
xattr -d com.apple.quarantine /Users/$loggedInUser/Applications/Slack.app
