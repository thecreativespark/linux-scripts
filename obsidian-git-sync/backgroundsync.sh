#!/bin/bash

vaultpath = "~/anugsan/"

cd $vaultpath

while [1]
do
    bash obsidiansync.sh
    sleep 60
done

exit 0
