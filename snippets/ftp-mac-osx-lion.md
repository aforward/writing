# Enable FTP on Mac OS X Lion

```bash
# enable the ftp server
sudo -s launchctl load -w /System/Library/LaunchDaemons/ftp.plist

#disable the server when you are done
sudo -s launchctl unload -w /System/Library/LaunchDaemons/ftp.plist
```
