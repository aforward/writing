# Bootstrapping 1Password CLI using Expect
#meta sort 2020-08-27
#meta tags[] 1password
## August 27, 2020

Did you know [1Password has a CLI tool](https://support.1password.com/command-line-getting-started/)? In this article we will write a [small script using expect](https://linux.die.net/man/1/expect) called `opsession` to better manage secrets in our automation pipeline.  Using `opsession` you can then use 1password `op` commands like

```
op get item db_password --session $(opsession)
```

Without having any user intervention.
