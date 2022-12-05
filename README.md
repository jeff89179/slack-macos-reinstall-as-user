# Slack macOS Reinstall as Current User

This script reinstalls Slack.app to the current console user's Applications folder instead of the root Applications folder in order to circumvent permissions issue with the Slack Update Helper Tool.

Only use this if your organization doesn't have any restrictions on what versions of Slack you're allowed to install or run.
This script allows standard users to update Slack automatically.

I've include 2 scripts...
- one that is compatible with Addigy
- one that can be used with any SSH or terminal session since it doesn't depend on Addigy specific binaries.

NOTE: This script will not be maintained very often.
