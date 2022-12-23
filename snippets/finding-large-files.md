# Find large files on a Linux / Mac OS X machine

The following should owrk on your Mac OS X

```bash
sudo find / -type f -size +20000k -exec ls -lh {} \; | awk '{ print $9 ": " $5 }'
```

For a linux (tested on Ubuntu), the $9 most liley needs to be an $8

```bash
sudo find / -type f -size +20000k -exec ls -lh {} \; | awk '{ print $8 ": " $5 }'
```