#!/bin/env bash

FILE_NAME=~/Videos/screencast-creating.mp4

wf_start() {
	mkdir -p ~/Videos
	
	wf-recorder -g "$(slurp)" -f $FILE_NAME 
}

wf_stop() {
	pkill -INT -x wf-recorder
	notify-send "Saved recording to ~/Videos"
	mv $FILE_NAME ~/Videos/screencast-$(date +%s).mp4
	exit 0
}

wf_start_stop() {
	if pgrep -x "wf-recorder" > /dev/null; then
		wf_stop
	else
		wf_start
	fi
}

wf_start_stop
