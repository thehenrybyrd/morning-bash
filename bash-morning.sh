#!/bin/bash

# Goals here are:
#  - feel like I have caught up on p2s and slack, but don't get consumed
#  - set myself up for what to do today by prioritizing first thing
#  - prioritize reviewing other people's tickets
#  - turn off slack
#  - start ticketing

source timed-functions.sh

if [ -z "$1" ]; then
	TYPE="default"
else
	TYPE="$1"
fi

echo "Slack"
osascript -e 'activate application "Slack"'
timed_msg "Start five minutes of Slack" 3 &&
timed_msg "Finish Slack in two minutes" 2 &&
timed_confirm "Ready for alerts?" "Does today look like a catch up morning?" 180

echo "Alerts"
open https://inbox.google.com/u/1/
osascript -e 'activate application "Google Chrome"'
timed_msg "look at e-mail alerts" 2 &&
timed_confirm "Done with alerts?" "Does today look like a catch up morning?" 300

echo "P2s"
osascript -e 'activate application "Google Chrome"'
open https://wpcomhappy.wordpress.com/
open https://wehavetheanswers.wordpress.com/
timed_msg "Start five minutes of p2s, but do not read 90% now." 3 &&
timed_msg "Finish p2s in five minutes" 2 &&
timed_confirm "Ready for notifications?" "do not respond now, make it a task" 180

echo "Notifications"
osascript -e 'activate application "Google Chrome"'
open https://wpcomhappy.wordpress.com/
timed_msg "Check your notifications and open any you need to respond to" 3 &&
timed_msg "Finish notifications in five minutes" 2 &&
timed_confirm "Ready for calendar?" 180


echo "Calendar"
open https://calendar.google.com/calendar/b/0/render#main_7
osascript -e 'activate application "Google Chrome"'
timed_msg "Verify Calendar. Anything that needs scheduling?" 1 &&
timed_confirm "Ready for meditation?" "meditate?" 120

echo "Meditation"
timed_msg "Start meditation in one minute" 1 &&
timed_msg "Start meditation" $(timed_weekly_ramp 2019-05-07 1 3 5 7 10) &&
timed_msg "Finish" 1 &&
timed_confirm "Ready for journal?" "journal?" 180

echo "Journal"
osascript -e 'activate application "Notes"'
timed_msg "Start five minutes of journal" 4 &&
timed_msg "Finish journal in one minute" 1 &&
timed_confirm "Ready for music?" "music?" 180


echo "Music"
osascript -e 'activate application "Spotify"'
timed_msg "Start some music" 2 &&
timed_confirm "Ready for standup?" "standup?" 180


echo "Standup"
timed_msg "Write hi in the channel" 2 &&
osascript -e 'activate application "Slack"'
timed_confirm "Standup posted?" "ticket review?" 180


echo "Ticket Review"
timed_confirm "Start ticket review. Ready to close Slack?" "Close slack and review?" 300
osascript -e 'quit app "Slack"'
open https://app.qualitista.com
osascript -e 'activate application "Google Chrome"'

timed_msg "Review tickets" 10 &&
timed_confirm "Done reviewing?" "Done reviewing?" 300

echo "Tickets"
timed_confirm "Start tickets. Ready to jump in?" "Do some tickets?" 300
open https://woothemes.zendesk.com/agent/filters/360000838386
osascript -e 'activate application "Google Chrome"'
		
timed_msg "Start ten minutes of tickets" 5&&
timed_confirm "Are you really ticketing?" "Still ticketing?" 600

