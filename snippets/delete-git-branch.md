# Deleting Git Branches

Delete the "demo_maintenance" branch on the "origin" remote server.

```bash
git push origin :demo_maintenance # deletes the remote branch
git branch -d demo_maintenance # deletes the local branch
```

If you need to 'force' the delete on your local machine, use -D

```bash
git branch -D demo_maintenance # deletes the local branch
```