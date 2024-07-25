#!/bin/bash

git add .
git pull
git pull --rebase

current_time=$(date +%H:%M:%S)
git add .
git commit -m "[$current_time]"
git push origin HEAD:main

exit 0

