#!/usr/bin/env bash

FF_PROFILE=`cat "$HOME/.mozilla/firefox/profiles.ini" | sed -n -e 's/^.*Path=//p' | head -n 1`
PREF_PATH=~/.mozilla/firefox/$FF_PROFILE

# Need to stop Firefox to edit prefs.js
echo "Stopping Firefox"
killall firefox

# Add user preference to enable popup block
echo 'user_pref("dom.disable_open_during_load", true);' >> $PREF_PATH/user.js
