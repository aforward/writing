# Dealing with CSV files and MS Excel (.xls / .xlsx)

When dealing with CSV, you need to get your encodings correct.Excel will typically export to ISO-8859-1. This is not good, and should be converted to UTF-8 to support non english files.

To check the encoding of a file

```bash
file -I original_file.csv
```

To convert between encodings (a few common examples)

```bash
iconv --from-code=ISO-8859-1 --to-code=UTF-8 original_file.csv > new_file.utf8.csv
iconv --from-code=MacRoman --to-code=UTF-8 original_file.csv > new_file.utf8.csv
```

When exporting files to be read within Excel, you will need to convert the CSV based on the target platform.

## For MAC

```bash
iconv --from-code=UTF-8 --to-code=MacRoman downloaded_file.csv > downloaded_file_mac.excel.csv
```

## For PC (untested)

```bash
iconv --from-code=UTF-8 --to-code=Windows-1252 downloaded_file.csv > downloaded_file_windows.excel.csv
```
