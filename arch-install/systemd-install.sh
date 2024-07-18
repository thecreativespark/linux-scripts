#!/bin/bash

bootctl --boot-path=/boot install
lsblk
cp arch.conf /boot/loader/entries/
cp loader.conf /boot/loader/loader.conf
bootctl update


