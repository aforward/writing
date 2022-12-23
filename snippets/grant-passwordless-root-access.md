# Granting passwordless access to root on RHEL

When running CHEF, it needs root access, so if you are using something like chef-solo, and you like
automated scripts, then here is how grant that access.  PLEASE NOTE, THIS IS VERY UNSAFE, to
avoid try, I created a (now obsolete) [CHEF BOOTSTRAP](https://github.com/aforward/chef-bootstrap).

```bash
$ mkdir -p /root/.ssh
$ chmod 700 /root/.ssh
$ chmod 600 /roiot/.ssh/authorized_keys
$ restorecon -R -v /root/.ssh
```
