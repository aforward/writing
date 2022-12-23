# Tar / Untar a file

Compress a directly into a tar.gz file:

```bash
tar cvzf myapp.tar.gz myapp/
```

Uncompress that file back into a directory:

```bash
tar zxfv myapp.tar.gz
```

Uncompress a gz zip (no tar):

```bash
gzcat x.txt.gz >x.txt
gunzip -c x.txt.gz >x.txt
```
