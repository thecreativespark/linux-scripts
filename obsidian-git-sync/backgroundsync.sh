#!/bin/bash

vaultpath="$HOME/anugsan/"

cd "$vaultpath"

while true
do
    bash obsidiansync.sh
    sleep 10
done

exit 0

