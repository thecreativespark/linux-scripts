#!/bin/bash

vaultpath="$HOME/anugsan/"

cd "$vaultpath"

bash obsidiansync.sh

while true
do
    bash obsidiansync.sh
    sleep 900
done

exit 0

