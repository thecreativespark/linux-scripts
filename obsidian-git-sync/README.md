## Step 1
Create a remote Git Repo which will be used to sync the obsidian vault

## Step 2
Setup Git with username, email and ssh locally

## Step 3
Clone the remote git repo

## Step 4
Copy the obsidiansync.sh to the directory of the vault

## Step 5
Open the directory of the local repo in obsidian as a Vault

## Step 6
Run obsidiansync.sh to sync

## Step 7
Setup to sync automatically, by changing the vaultpath in `backgroundsync.sh`, then copying the `backgroundsync.sh` file to `~/.config/` and pasting the following code at the end of `~/config/i3/config`

```
exec ~/config/backgroundsync.sh &
```
