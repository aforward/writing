# Undo the last pushed commited

If you already committed the change, then you need to do hard resets:

```bash
git reset --hard HEAD~1
git push -f
```
