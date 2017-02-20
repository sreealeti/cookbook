#!/bin/bash
BASE=$(dirname "$0")
SNAME=cookbook
cd $BASE;bundle
tmux new-session -d -s $SNAME -n vi "cd $BASE;vim"
tmux new-window -t $SNAME:2 -n server "cd $BASE;rails s"
tmux split-window -v "cd $BASE;rails c"
tmux split-window -h "mysql -h $COOKBOOK_HOST -u $COOKBOOK_USER -p$COOKBOOK_PASSWORD $COOKBOOK_DATABASE"
tmux new-window -t $SNAME:3 -n git

tmux select-window -t $SNAME:1
tmux attach -t $SNAME
