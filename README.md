# FiveM Death Note Script

A simple FiveM script that adds a death note command to your server.

## Features

- `/deathnote [id]` command that kills a specified player after 5 seconds
- Plays a sound effect when the death note is used
- Server-side validation of player IDs

## Installation

1. Create a folder named `deathnote` in your FiveM server's resources directory
2. Copy all the files from this repository into that folder
3. Add `start deathnote` to your server.cfg file
4. Restart your FiveM server

## Usage

In-game, use the command:
```
/deathnote [player_id]
```

Where `[player_id]` is the ID of the player you want to kill.

## Permissions (Optional)

To restrict the command to certain players, uncomment the ACL permission check in server.lua and add the following to your server.cfg:

```
add_ace group.admin command.deathnote allow
```

Then assign players to the admin group:

```
add_principal identifier.steam:STEAMID group.admin
```