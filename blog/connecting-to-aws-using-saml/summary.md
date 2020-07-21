# Connecting to AWS using SAML
#meta sort 2019-05-30
#meta tags[] chef devops aws saml
### May 29, 2019

In this article we will connect to our AWS account using SAML, this will allow us to run
AWS CLI commands using the same authentication as you use in the browser.

Once complete, you will be able to run

```
saml2aws login -a 10xdev
```

An and then have a (configurable) 12 hour session to from the command line.
