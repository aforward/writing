# Automating 1Password CLI with --session
#meta sort 2020-08-28
#meta tags[] 1password
## August 28, 2020

In a [our previous post](/articles/1password-bootstrap), we looked
at generating a 1password session without requiring user input.
Today we will look at generating a _one-time_ (30-minute) token
on your local machine and only sharing that with your build servers.

```
op get item db_password --session $(cat opsession)
```
