# Install older version of HTML to PDF (wkhtmltopdf) using Homebrew on a Mac

Bug with current version that will cause the process to not exit properly:</p>

```bash
brew uninstall wkhtmltopdf
cd /usr/local/Library/Formula/
git checkout 6e2d550 /usr/local/Library/Formula/wkhtmltopdf.rb
brew install wkhtmltopdf
wkhtmltopdf --version | grep 0.9.9
```

Ticket was described [here](https://code.google.com/p/wkhtmltopdf/issues/detail?id=141), but now the site (and history)
have for [wkhtmltopdf.org](https://wkhtmltopdf.org/) have moved.
Thank you to [wearepandr](http://wearepandr.com/blog/article/homebrew-and-installing-old-package-versions)
