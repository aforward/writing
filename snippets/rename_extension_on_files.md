# Rename exentions on a file

```bash
find . -name '*.php.eex' -exec sh -c 'mv "$0" "${0%.php.eex}.eex"' {} \;
find . -name '*.php' -exec sh -c 'mv "$0" "${0%.php}.eex"' {} \;
```