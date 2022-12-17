# Connecting to AWS using SAML
#meta datetime 2019-05-30
#meta tags[] chef devops aws saml

## Summary

In this article we will connect to our AWS account using SAML, this will allow us to run
AWS CLI commands using the same authentication as you use in the browser.

Once complete, you will be able to run

```bash
saml2aws login -a 10xdev
```

An and then have a (configurable) 12 hour session to from the command line.

## Article

In this article we will connect to our AWS account using SAML, this will allow us to run
AWS CLI commands using the same authentication as you use in the browser.

### Installing AWS CLI

You can [read the full instructions here](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html),
below are instructions just for the mac and might be out of date.

I strongly advise against anyone simply running bash commands they find on the interwebs.  Go read the code,
consider doing a checksum and then proceeding.  Asuming you have done that, as I have, then you can continue...

```bash
mkdir -p /tmp/awsinstall && \
  cd /tmp/awsinstall && \
  curl -o awscli-bundle.zip https://s3.amazonaws.com/aws-cli/awscli-bundle.zip && \
  unzip awscli-bundle.zip && \
  sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
```

Once installed, you should be able to check the version of your AWS cli

```bash
$ aws --version
aws-cli/1.16.167 Python/2.7.10 Darwin/18.6.0 botocore/1.12.157
```

### Installing SAML2AWS

Let's install [saml2aws](https://github.com/Versent/saml2aws) to allow
us to login and retrieve AWS temporary credentials.  This uses SAML with
ADFS or PingFederate Identity Providers.

```bash
brew tap versent/homebrew-taps
brew install saml2aws
```

If that installed as expected, then you should be able check which which version is
installed, something like

```bash
$ saml2aws --version
2.14.0
```

Now let's configure account access (and 12 hour access).  For simplicity let's call our
AWS Account Name  `10xdev`.  So where ever you see `10xdev` please do not

### Connect SAML to your AWS Account

```bash
saml2aws configure -a 10xdev --session-duration 43200
```

Answer all the questions, with help probably.  Here's an example using JumpCloud.

```bash
? Please choose a provider: JumpCloud
? AWS Profile 10xdev
? URL https://sso.jumpcloud.com/saml2/awsJumpCloudDeveloper
? Username aforward@gmail.com
? Password *************************
? Confirm *************************
```

### Login To AWS using SAML

If everything worked as expected, then you should be able to use `saml2aws` to login.

```bash
saml2aws login -a 10xdev
```

Provide your credentials and you should now be logged in for 12 hours

```bash
Using IDP Account 10xdev to access JumpCloud https://sso.jumpcloud.com/saml2/awsJumpCloudDeveloper
To use saved password just hit enter.
? Username aforward@gmail.com
? Password *************************

Authenticating as aforward@gmail.com ...
Selected role: arn:aws:iam::9021090210:role/JumpCloudDeveloper
Requesting AWS credentials using SAML assertion
Logged in as: arn:aws:sts::9021090210:assumed-role/JumpCloudDeveloper/aforward@gmail.com

Your new access key pair has been stored in the AWS configuration
Note that it will expire at 2019-05-30 03:07:37 -0400 EDT
To use this credential, call the AWS CLI with the --profile option (e.g. aws --profile 10xdev ec2 describe-instances).
```

Now try and run an AWS command, for example listing all S3 buckets in a region.

```bash
aws --profile 10xdev s3 ls --region us-east-1
```
