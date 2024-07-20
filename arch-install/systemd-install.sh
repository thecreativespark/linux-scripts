#!/bin/bash

bootctl install --boot-path=/boot
lsblk
cp -f arch.conf /boot/loader/entries/
cp -f loader.conf /boot/loader/
bootctl update
