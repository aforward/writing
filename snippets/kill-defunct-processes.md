# Kill a Defunct Process

```bash
# Locate defunct processes
ps -A | grep defunct

# Get the parent ID (UID PID PPID ...)
ps -ef | grep defunct | more

# for example...
deployer  2707  2698  0  2012 ?        00:00:03 [unicorn_rails] <defunct>
deployer  2710  2698  0  2012 ?        00:00:04 [unicorn_rails] <defunct>

# Kill the parent PID (PPID)
kill -9 2698
```
