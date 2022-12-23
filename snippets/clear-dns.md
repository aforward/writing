# Clear Your Local DNS Cache

```bash
dscacheutil -flushcache
```

On newer Macs, somethings this works too.

```bash
sudo killall -HUP mDNSResponder
```
