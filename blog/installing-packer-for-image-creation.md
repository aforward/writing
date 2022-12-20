# Installing Packer For Image Creation
#meta datetime 2019-07-03
#meta tags[] chef devops aws

## Summary

After you install [Golang](https://golang.org/), it's
easy to [install Packer from source](https://www.packer.io/intro/getting-started/install.html#compiling-from-source).

```bash
mkdir -p ~/src && \\
  cd ~/src && \\
  git clone https://github.com/hashicorp/packer.git && \\
  cd packer && \\
  make dev
```

## Article

Now that we have [installed chefdk](/articles/installing-chefdk-on-mac)
and are connected to our [aws via saml](/articles/connecting-to-aws-using-saml)
let's install [Packer](https://www.packer.io/) to help us
create (and later automate) the creation of a preconfigured AWS server.

First we need to install [Golang](https://golang.org/).  For this,
I used Brew as [installing from source](https://golang.org/doc/install/source)
see way too complicated.

```bash
brew install go
```

For packer however, once [Golang](https://golang.org/) is installed, it seems rather straight forward
to [install from source](https://www.packer.io/intro/getting-started/install.html#compiling-from-source).

```bash
mkdir -p ~/src && \\
  cd ~/src && \\
  git clone https://github.com/hashicorp/packer.git && \\
  cd packer && \\
  make dev
```

The installed things into `~/src/packer`. Let's make the packer
tools available from anywhere on your machine by adding it
to your path.

```bash
vi ~/.bash_profile
```

And in there add a line that looks like the following

```bash
...
PATH="$HOME/src/packer/bin:$PATH"
...
export PATH
```

If everything worked as expected then open up a new terminal, and
check the version of your installed `packer`

```bash
$ packer -v
```