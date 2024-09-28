#!/usr/bin/bash

tmux kill-session -t wget_session || true
tmux new-session -d -A -s wget_session

for f in $@; do
tmux new-window -t wget_session "bash -c \"./wgetwrapper.sh '$f'; read\""
done

tmux attach -t wget_session
