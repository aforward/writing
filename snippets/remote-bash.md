# Run A Script Remotely Using SSH

For simple scripts, just pass them via a quoted string.

```bash
ssh name@server.com 'ls -la'
```

For more complicated scripts, put them in a local file and stream them to the server.

```
ssh name@server.com 'bash -s' < local_script.sh
```