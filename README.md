# tos-desktop
ThinkSwim Desktop on Web Browser


## How to start
- start codespace in github
- in console: enter `make start`
- once a URL appears, click it.
- It will start an ubuntu OS on a browser
- If this is the first time u use it, ThinkOrSwim desktop will be installing at the background, in a few minutes, you will see an icon


## How to backup
- `make backup` this will zip up the whole installer including your system configuration into a zip file
- save it somewhere save.

## How to restore
- if you have a new codespace, upload the backup zip into backup directory
- `make restore`

# Note
- Your codespace if it is not use for 30 days (inactivity) will be deleted by github automatically with an email warning.
- This is the reasons you should periodically backup and download the zip file somewhere safe so that all are setting can be restore with a new codespace instance
