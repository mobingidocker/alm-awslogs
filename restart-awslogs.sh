#!/bin/bash

EVENT="-e CLOSE_WRITE"
TARGET="/etc/awslogs/awscli.conf"

inotifywait -m -q $EVENT $TARGET | while read LINE
do
  /usr/local/bin/supervisorctl restart awslogs
done
